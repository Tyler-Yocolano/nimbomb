# The main module to import when using this library.

import os
import httpclient, json, uri,tables
import strutils
include resources.resource 

# - Type definitions

type 
    JsonResponse* = object
        ## The response from GB will always be given with these fields.
        error*: string              ## This should read "OK".
        limit*: int                 ## The amount of results to show.
        offset*: int                ## ???
        pgResults*: int             ## The number of results shown.
        totalResults*: int          ## Total number of results.
        statusCode*: int            ## An integer indicating the 
                                    ## result of the request.
        results*: seq[JsonNode]     ## The results to be turned into Resources
                                    ## or Field content.
        result*: JsonNode

    NimbombClient* = object
        ## Client used to communicate to the GiantBomb Wiki API.
        client: HttpClient          ## An HttpClient used to make requests.
        url: Uri                    ## The url to be requested.
        apiKey: string              ## API Key needed to make requests.
                                    ## Place only the key in a file called:
                                    ## giantbomb.api
                                    ## within the app directory.
        lastResponse*: JsonResponse ## The last jsonresponse from the server.

proc jsonToRes*(element: JsonNode, resType: string): Resource =
    ## Converts a json node to a resource.
    result = newResource(resType)
    for key, val in pairs(element.getFields()): #Iterate through the node's k/v pairs.
        case val.kind:
            of JString:
                let cont = val.getStr()
                result.fieldList.getField(key).setContent(cont)
                #echo(key & " set to: " & $result.fieldList.getField(key))
            of JInt:
                let cont = val.getNum().int
                result.fieldList.getField(key).setContent(cont)
                #echo(key & " set to: " & $result.fieldList.getField(key))
            of JObject:
                try:
                    let cont = jsonToRes(val, key)
                    result.fieldList.getField(key).setContent(cont)
                except:
                    # If the field doesn't exist, return an error.
                    result = newResource("error")
                #echo(key & " set to: " & $result.fieldList.getField(key))
            of JArray:
                var list: seq[Resource] = @[]
                for obj in val:
                    try:
                        let arrRes = result.fieldList.getField(key).arrKind
                        let cont = jsonToRes(obj, $arrRes)
                        list.add(cont)
                    except:
                        discard
                result.fieldList.getField(key).setContent(list)
            else:
                discard


proc jsonToRes*(response: seq[JsonNode]): seq[Resource] =
    result = @[]
    for elem in response:
        var newRes = jsonToRes(elem, elem["resource_type"].getStr())
        result.add(newRes)

let api = getCurrentDir() / "giantbomb.api" # Points to the api-key file.

proc newNimbombClient*(): NimbombClient =
    ## Creates a new nimbomb client preset to giantbomb's api address.
    result.apiKey = open(api).readLine()
    result.client = newHttpClient()
    result.client.headers = newHttpHeaders({ "Content-Type" :
                                             "application/json"})
    result.url = initUri() / "http://www.giantbomb.com/api/"

proc parseSearch(data: string): JsonResponse =
    let dataJson = parseJson(data)
    result.error = dataJson["error"].getStr()
    result.limit = dataJson["limit"].getNum().int
    result.offset = dataJson["offset"].getNum().int
    result.pgResults = dataJson["number_of_page_results"].getNum().int
    result.totalResults = dataJson["number_of_total_results"].getNum().int
    result.statusCode = dataJson["status_code"].getNum().int
    result.results = dataJson["results"].getElems()

proc parseResponse(data: string): JsonResponse =
    let dataJson = parseJson(data)
    result.error = dataJson["error"].getStr()
    result.limit = dataJson["limit"].getNum().int
    result.offset = dataJson["offset"].getNum().int
    result.pgResults = dataJson["number_of_page_results"].getNum().int
    result.totalResults = dataJson["number_of_total_results"].getNum().int
    result.statusCode = dataJson["status_code"].getNum().int
    result.result = dataJson["results"]

proc search*(nimbClient: var NimbombClient, query: string,
             resources: varargs[string] = "game"): seq[Resource] =
    ## Search function to find any type of resource offered in the wiki.
    var qStruct = nimbClient.url
    var appends: seq[string] = @[]
    let toSearch = query.replace(" ", "%20")
    appends.add("search")
    appends.add("?api_key=" & nimbClient.apiKey & "&format=json&query=%22" & toSearch & "%22&resources=")
    for i in 0 .. <resources.len:
        appends[<appends.len].add(resources[i])
        if i != <resources.len:
            appends[<appends.len].add(",")
    for path in appends:
        qStruct = qStruct / path
    let resp = nimbClient.client.getContent($qStruct)
    nimbClient.lastResponse = parseSearch(resp)
    result = jsonToRes(nimbClient.lastResponse.results)

proc get*(nimbClient: var NimbombClient, adu: string): Resource =
    let qStruct = adu / ("?api_key=" & nimbClient.apiKey & "&format=json")
    let resp = nimbClient.client.getContent($qStruct)
    nimbClient.lastResponse = parseResponse(resp)

proc get*(nimbClient: var NimbombClient, fromSearch: Resource, filters: varargs[FieldObject]): Resource =
    ## Gets the full resource info from the api using the api_detail_url from the searched resource.
    var qStruct = fromSearch.fieldList.getField(apiDetailUrl).getStr() / ("?api_key=" & nimbClient.apiKey & "&format=json&field_list=")
    for i in 0..<filters.len:
        qStruct = qStruct / filters[i].apiName
        if i != <filters.len:
            qStruct = qStruct / ","
    #echo $qStruct
    let resp = nimbClient.client.getContent($qStruct)
    nimbClient.lastResponse = parseResponse(resp)
    result = nimbClient.lastResponse.result.jsonToRes($fromSearch.apiName)

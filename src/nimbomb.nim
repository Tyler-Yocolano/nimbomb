# The main module to import when using this library.

import os
import httpclient, json, uri,tables
import strutils

include resources.resource # This is included for control over Resources.

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
        item*: JsonNode

    NimbombClient* = object
        ## Client used to communicate to the GiantBomb Wiki API.
        client: HttpClient          ## An HttpClient used to make requests.
        url: Uri                    ## The url to be requested.
        apiKey: string              ## API Key needed to make requests.
                                    ## Place only the key in a file called:
                                    ## giantbomb.api
                                    ## within the app directory.
        lastResponse*: JsonResponse ## The last jsonresponse from the server.
        results*: seq[Resource]     ## The results of the last response.

proc jsonToRes*(response: JsonNode, resourceType: ResourceType): seq[Resource] =
    echo("This func is doing nothing.")
    result = @[]
    result.add(newResource(rtGame))

proc jsonToRes*(response: seq[JsonNode]): seq[Resource] =
    echo("Creating Resource list from JsonNode list.")
    result = @[]
    for elem in response:
        var newRes = newResource(elem["resource_type"].getStr())
        echo("Creating a new " & newRes.apiName & " resource.")
        for key, val in pairs(elem.getFields()):
            case val.kind:
                of JString:
                    let cont = val.getStr()
                    echo("Setting " & key & " to " & cont)
                    newRes.fieldList.getField(key).setContent(cont)
                of JInt:
                    let cont = val.getNum().int
                    echo("Setting " & key & " to " & $cont)
                    newRes.fieldList.getField(key).setContent(cont)
                of JObject:
                    let cont = val.jsonToRes(rtGame)[0]
                    echo("Setting " & key & " to " & $cont)
                    newRes.fieldList.getField(key).setContent(cont)
                else:
                    discard
        result.add(newRes)
    echo($result.len() & " resources added to current results.")

let api = getCurrentDir() / "giantbomb.api" # Points to the api-key file.

proc newNimbombClient*(): NimbombClient =
    ## Creates a new nimbomb client preset to giantbomb's api address.
    result.apiKey = open(api).readLine()
    result.client = newHttpClient()
    result.client.headers = newHttpHeaders({ "Content-Type" :
                                             "application/json"})
    result.url = initUri() / "http://www.giantbomb.com/api/"
    result.results = @[]

proc parseSearch(data: string): JsonResponse =
    echo("Parsing search...")
    let dataJson = parseJson(data)
    result.error = dataJson["error"].getStr()
    result.limit = dataJson["limit"].getNum().int
    result.offset = dataJson["offset"].getNum().int
    result.pgResults = dataJson["number_of_page_results"].getNum().int
    result.totalResults = dataJson["number_of_total_results"].getNum().int
    result.statusCode = dataJson["status_code"].getNum().int
    result.results = dataJson["results"].getElems()
    echo("Search succeeded with " & $result.totalResults & " results.")
    echo("Result[0]'s ADU is " & result.results[0][apiDetailUrl.apiName].getStr())

proc parseResponse(data: string): JsonResponse =
    echo("Parsing one response.")
    let dataJson = parseJson(data)
    result.error = dataJson["error"].getStr()
    result.limit = dataJson["limit"].getNum().int
    result.offset = dataJson["offset"].getNum().int
    result.pgResults = dataJson["number_of_page_results"].getNum().int
    result.totalResults = dataJson["number_of_total_results"].getNum().int
    result.statusCode = dataJson["status_code"].getNum().int
    result.item = dataJson["results"]
    echo("Parse succeeded with " & result.item["name"].getStr())

proc search*(nimbClient: var NimbombClient, query: string,
             resources: varargs[ResourceType] = rtGame) =
    ## Search function to find any type of resource offered in the wiki.
    echo("Searching for " & query)
    var qStruct = nimbClient.url
    var appends: seq[string] = @[]
    let toSearch = query.replace(" ", "%20")
    appends.add("search")
    appends.add("?api_key=" & nimbClient.apiKey & "&format=json&query=%22" & toSearch & "%22&resources=")
    for i in 0 .. <resources.len:
        appends[<appends.len].add($resources[i])
        if i != <resources.len:
            appends[<appends.len].add(",")
    for path in appends:
        qStruct = qStruct / path
    echo("Requesting from " & $qStruct)
    let resp = nimbClient.client.getContent($qStruct)
    nimbClient.lastResponse = parseSearch(resp)
    nimbClient.results = jsonToRes(nimbClient.lastResponse.results)
    echo("Search complete.")

proc get*(nimbClient: var NimbombClient, adu: string, resourceType: ResourceType): Resource =
    echo("Getting object from " & adu)
    let qStruct = adu / ("?api_key=" & nimbClient.apiKey & "&format=json")
    let resp = nimbClient.client.getContent($qStruct)
    nimbClient.lastResponse = parseResponse(resp)
    nimbClient.results = jsonToRes(nimbClient.lastResponse.item, resourceType)
    result = nimbClient.results[0]
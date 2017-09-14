# The main module to import when using this library.

import os
import httpclient, json, uri,tables
import strutils
import nimbomb/private/[nbfield, nbresource, nbtypes]
import nimbomb.nbjson

# - Type definitions
export nimbomb.nbtypes

type 
    NimbombClient* = object
        ## Client used to communicate to the GiantBomb Wiki API.
        client: HttpClient          ## An HttpClient used to make requests.
        url: Uri                    ## The url to be requested.
        apiKey: string              ## API Key needed to make requests.
                                    ## Place only the key in a file called:
                                    ## giantbomb.api
                                    ## within the app directory.
        lastResponse*: JsonResponse ## The last jsonresponse from the server.

proc newNimbombClient*(): NimbombClient =
    ## Creates a new nimbomb client preset to giantbomb's api address.
    let api = getCurrentDir() / "giantbomb.api" # Points to the api-key file.
    try:
        result.apiKey = open(api).readLine()
    except:
        discard
    result.client = newHttpClient()
    result.client.headers = newHttpHeaders({ "Content-Type" :
                                             "application/json"})
    result.url = initUri() / "http://www.giantbomb.com/api/"

proc setAPIKey*(nimbombClient: var NimbombClient, apiKey: string) =
    nimbombClient.apiKey = apiKey

proc search*(nimbClient: var NimbombClient, query: string,
             resources: varargs[string] = ["game"]): seq[Resource] =
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
    #echo $qStruct
    let resp = nimbClient.client.getContent($qStruct)
    nimbClient.lastResponse = parseResponse(resp, true)
    result = jsonToRes(nimbClient.lastResponse.results)

proc get*(nimbClient: var NimbombClient, adu: string): Resource =
    let qStruct = adu / ("?api_key=" & nimbClient.apiKey & "&format=json")
    let resp = nimbClient.client.getContent($qStruct)
    nimbClient.lastResponse = parseResponse(resp)

proc get*(nimbClient: var NimbombClient, fromSearch: Resource, filters: varargs[FieldObj]): Resource =
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

proc getField*(resource: Resource, field: FieldObj): Field =
    result = resource.fieldList.getField(field)

proc `$`*(resource: Resource): string =
    var fl = resource.fieldList
    if fl.hasField("name"):
        result = resource.fieldList.getField(name).getStr()
    else:
        result = fl[0].apiName

proc `$`*(field: Field): string =
    case field.kind:
        of fkStr:
            result = field.getStr()
        of fkInt:
            result = $field.getInt()
        of fkRes:
            result = $field.getRes()
        of fkArr:
            result = field.arrKind
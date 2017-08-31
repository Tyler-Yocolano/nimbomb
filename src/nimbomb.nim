import resources.resource
import resources.api_key
import httpclient, json
import uri
import strutils

type 
    JsonResponse* = object
        error*: string
        limit*: int
        offset*: int
        pgResults*: int
        totalResults*: int
        statusCode*: int
        results*: seq[JsonNode]

    NimbombClient* = object
        client*: HttpClient
        url*: Uri

proc newNimbombClient(): NimbombClient =
    result.client = newHttpClient()
    result.client.headers = newHttpHeaders({ "Content-Type" : "application/json"})
    result.url = initUri() / "http://www.giantbomb.com/api/"

proc parseResponse(data: string): JsonResponse =
    let dataJson = parseJson(data)
    result.error = dataJson["error"].getStr()
    result.limit = dataJson["limit"].getNum().int
    result.offset = dataJson["offset"].getNum().int
    result.pgResults = dataJson["number_of_page_results"].getNum().int
    result.totalResults = dataJson["number_of_total_results"].getNum().int
    result.statusCode = dataJson["status_code"].getNum().int
    result.results = dataJson["results"].getElems()

proc search*(nimbClient: NimbombClient, query: string, resources: varargs[string] = "game"): JsonResponse =
    var qStruct = nimbClient.url
    var appends: seq[string] = @[]
    let toSearch = query.replace(" ", "%20")
    appends.add("search")
    appends.add("?api_key=" & key & "&format=json&query=%22" & toSearch & "%22&resources=")
    for i in 0 .. <resources.len:
        appends[<appends.len].add(resources[i])
        if i != <resources.len:
            appends[<appends.len].add(",")
    for path in appends:
        qStruct = qStruct / path
    let resp = nimbClient.client.getContent($qStruct)
    result = parseResponse(resp)

var nimbomber = newNimbombClient()

echo nimbomber.search("metroid", @["theme"]).totalResults
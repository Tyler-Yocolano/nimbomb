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

proc parseResponse(data: string): JsonResponse =
    let dataJson = parseJson(data)
    result.error = dataJson["error"].getStr()
    result.limit = dataJson["limit"].getNum().int
    result.offset = dataJson["offset"].getNum().int
    result.pgResults = dataJson["number_of_page_results"].getNum().int
    result.totalResults = dataJson["number_of_total_results"].getNum().int
    result.statusCode = dataJson["status_code"].getNum().int
    result.results = dataJson["results"].getElems()

var client = newHttpClient()
client.headers = newHttpHeaders({ "Content-Type" : "application/json"})

var url = initUri() / "http://www.giantbomb.com/api/"

var appends: seq[string] = @[]

proc search(query: string, resources: seq[string] = @["game"]): Uri =
    result = url
    var toSearch = query.replace(" ", "%20")
    appends.add("search")
    appends.add("?api_key=" & key & "&format=json&query=%22" & toSearch & "%22&resources=")
    for i in 0 .. <resources.len:
        appends[<appends.len].add(resources[i])
        if i != <resources.len:
            appends[<appends.len].add(",")
    for path in appends:
        result = result / path

echo $search("so many spaces", @["game", "character"])

#let resp = client.getContent($search("metroid prime"))
#let jsonResp = parseResponse(resp)

#echo jsonResp.totalResults

client.close()
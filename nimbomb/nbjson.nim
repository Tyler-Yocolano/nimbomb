import json
import tables
import private/[nbresource, nbfield]

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

proc parseResponse*(data: string, search: bool = false): JsonResponse =
    ## Parse the json response.  Set search to true if making a search.
    let dataJson = parseJson(data)
    result.error = dataJson["error"].getStr()
    result.limit = dataJson["limit"].getNum().int
    result.offset = dataJson["offset"].getNum().int
    result.pgResults = dataJson["number_of_page_results"].getNum().int
    result.totalResults = dataJson["number_of_total_results"].getNum().int
    result.statusCode = dataJson["status_code"].getNum().int
    if search:
        result.results = dataJson["results"].getElems()
    else:
        result.result = dataJson["results"]

proc jsonToRes*(element: JsonNode, resType: string): Resource =
    ## Converts a json node to a resource.
    result = newResource(resType)
    #echo("Creating a " & resType & " resource.")
    for key, val in pairs(element.getFields()): #Iterate through the node's k/v pairs.
        case val.kind:
            of JString:
                #echo("Got a string node.")
                let cont = val.getStr()
                result.getField(key).setContent(cont)
                #echo(key & " set to: " & result.getField(key).getStr())
            of JInt:
                #echo("Got an int node.")
                let cont = val.getNum().int
                result.getField(key).setContent(cont)
                #echo(key & " set to: " & $result.getField(key).getInt)
            of JObject:
                #echo("Got an object node.")
                let cont = jsonToRes(val, key)
                result.getField(key).setContent(cont)
                #echo(key & " set to: " & $result.getField(key).getRes())
            of JArray:
                #echo("Got an array node.")
                var list: seq[Resource] = @[]
                for obj in val:
                    #echo(key)
                    let arrRes = result.getField(key).arrKind
                    #echo(arrRes)
                    let cont = jsonToRes(obj, arrRes)
                    list.add(cont)
                result.getField(key).setContent(list)
            else:
                discard

proc jsonToRes*(response: seq[JsonNode]): seq[Resource] =
    result = @[]
    for elem in response:
        var newRes = jsonToRes(elem, elem["resource_type"].getStr())
        result.add(newRes)
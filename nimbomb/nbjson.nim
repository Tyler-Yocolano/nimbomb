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
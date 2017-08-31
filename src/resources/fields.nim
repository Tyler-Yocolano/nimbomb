import sequtils

type
    Field = object
        apiName*: string
        validRes*: seq[string]

proc newField(apiName: string, validRes: seq[string]): Field =
    result.apiName = apiName
    result.validRes = validRes

let fieldList* = [
    newField("aliases",
    @["game"]),
    newField("api_detail_url",
    @["game"])
]

proc getFields*(res: string): seq[string] =
    result = newSeq[string]()
    var filtered = filter(@fieldList) do (x:Field) -> bool : res in x.validRes
    for field in filtered:
        result.add(field.apiName)
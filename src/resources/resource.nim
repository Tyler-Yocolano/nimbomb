import fields

type
    Resource* = object
        apiName*: string
        filters*: seq[string]
        fields*: seq[string]

proc newResource(apiName: string): Resource =
    result.apiName = apiName
    result.fields = getFields(apiName)
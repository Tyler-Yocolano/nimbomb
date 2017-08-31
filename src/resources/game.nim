import fields
import resource

#[

type
Game* = Resource
    apiName*: string
    fieldList*: seq[string]

proc newGame*(): Game =
    result.apiName = "game"
    #result.fieldList = getFieldList("game")

]#
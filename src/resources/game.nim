import fields

type
    Game = object
        apiName: string
        fieldList: seq[string]

proc newGame*(): Game =
    result.apiName = "game"
    result.fieldList = getFieldList("game")

echo newGame().fieldList
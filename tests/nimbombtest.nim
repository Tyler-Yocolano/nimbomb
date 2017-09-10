import "../src/nimbomb"
import json
import os

when isMainModule:
    block parseTest:
        let test = parseFile(getCurrentDir() / "tests/testresponse.json")
        let results = jsonToRes(test["results"].getElems())
        assert($results[0].fieldList.getField(nameField) == "Zelda")
    block gBConnectTest:
        var nimbomber = newNimbombClient()
        let results = nimbomber.search("halo")
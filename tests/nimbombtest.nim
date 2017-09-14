import "../nimbomb"
import json
import os

when isMainModule:
    block parseTest:
        let test = parseFile(getCurrentDir() / "tests/testresponse.json")
        let results = jsonToRes(test["results"].getElems())
        assert($results[0].fieldList.getField(name) == "Zelda", "Error: something is wrong with the Json2Resource parser.")
    block gBConnectTest:
        var nimbomber = newNimbombClient()
        let results = nimbomber.search("halo")
        assert(nimbomber.lastResponse.error == "OK", "Error: " & nimbomber.lastResponse.error)
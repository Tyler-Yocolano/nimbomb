import nimbomb
import nimbomb/[nbjson, private/nbfield]
import json
import os

when isMainModule:
    block parseTest:
        let test = parseFile(getCurrentDir() / "tests/testresponse.json")
        let results = jsonToRes(test["results"].getElems())
        assert(results[0].getField(name).getStr() == "Zelda", "Error: something is wrong with the Json2Resource parser.")
    block gBConnectTest:
        var nimbomber = newNimbombClient()
        let results = nimbomber.search("zelda", rtCharacter)
        discard nimbomber.get(results[0])
        assert(nimbomber.lastResponse.error == "OK", "Error: " & nimbomber.lastResponse.error)
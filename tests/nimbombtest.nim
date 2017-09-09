import "../src/nimbomb"
import json

when isMainModule:
    block:
        var nimbomber = newNimbombClient()
        let sResults = nimbomber.search("halo", rtGame)
        assert( nimbomber.lastResponse.error == "OK")
        let game = nimbomber.get(sResults[0])
        echo($game)
        for field in game.fieldList:
            echo($field)
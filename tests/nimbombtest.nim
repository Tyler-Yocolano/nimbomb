import "../src/nimbomb"
import json

when isMainModule:
    block:
        var nimbomber = newNimbombClient()
        nimbomber.search("halo", rtGame)
        assert( nimbomber.lastResponse.error == "OK")
        for res in nimbomber.results:
            echo($res)
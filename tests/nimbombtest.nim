import "../src/nimbomb"
import json

when isMainModule:
    block:
        var nimbomber = newNimbombClient()
        let sResults = nimbomber.search("zelda", rtCharacter)
        assert( nimbomber.lastResponse.error == "OK")
        for res in sResults:
            echo res.apiName
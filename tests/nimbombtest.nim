import "../src/nimbomb"
import json

when isMainModule:
    block:
        var nimbomber = newNimbombClient()
        nimbomber.search("halo", rtGame)
        assert( nimbomber.lastResponse.error == "OK")
        for res in nimbomber.results:
            echo(res.fieldList.getField("name").getStr())
        #let results = nimbomber.results
        #let game = nimbomber.get(results[9].fieldList.getField("api_detail_url").strContent, rtGame)
        #echo(game.fieldList.getField("name").strContent)
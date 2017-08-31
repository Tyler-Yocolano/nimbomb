import fields

type
    ResourceType* = enum
        accessory = "accessory",
        accessories = "accessories",
        character = "character",
        game = "game"

    Resource* = object
        apiName*: string
        filters*: seq[string]
        fields*: seq[Field]

proc newResource*(resType: ResourceType): Resource =
    result.apiName = $resType
    case result.apiName:
        of "accessory", "accessories":
            result.fields = @[apiDetailUrl, added, lastUpdated,
                summary, desc, id, image, name, siteDetailUrl]
        of "character":
            result.fields = @[aliases, apiDetailUrl, birthday,
                concepts, added, lastUpdated, summary, desc,
                enemies, firstInGame, franchises, friends,
                games, gender, id, image, lastName, locations,
                name, objects, people, realName, siteDetailUrl]
        of "characters":
            result.fields = @[aliases, apiDetailUrl, birthday,
                added, lastUpdated, summary, desc, firstInGame,
                gender, id, image, lastName, name, realName,
                siteDetailUrl]
        of "chat", "chats":
            result.fields = @[apiDetailUrl, channelName, summary,
                image, password, siteDetailUrl, title]
        of "company", "companies":
            discard
        of "game":
            result.fields = @[aliases, apiDetailUrl, characters,
                concepts, added, lastUpdated, summary, desc,
                devs, expReleaseDay, expReleaseMon, expReleaseQrtr,
                expReleaseYear, firstChars, firstConcepts, firstLocs,
                firstObjects, firstPeople, franchises, genres, id,
                image, images, killedChars, locations, name,
                amtUserReviews, objects, origGameRating, origRlsDate,
                people, platforms, publishers, releases, dlcs, reviews,
                similarGames, siteDetailUrl, themes, videos]
        of "games":
            result.fields = @[aliases, apiDetailUrl, added, 
                lastUpdated, summary, desc, expReleaseMon, 
                expReleaseQrtr, expReleaseYear, image, name,
                amtUserReviews,origGameRating, origRlsDate,
                platforms, siteDetailUrl]

proc newResource*(resType: string): Resource =
    for t in ResourceType.items:
        if $t == resType:
            return newResource(t)
    raise newException(Exception, "Tried to instance bad resource type: " & resType)
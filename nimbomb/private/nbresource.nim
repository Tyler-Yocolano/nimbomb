# Defines the resources and fields contained within a request.

import sequtils, strutils
import nbtypes
import nbfield

export Resource, FieldList

# - Type procedures
proc newResource*(resType: string): Resource =
    ## Creates a new resource and fills in the field list based on its type.
    ## Can be found at https://www.giantbomb.com/api/documentation
    result.apiName = $resType
    result.filters = @["field_list"]

    case result.apiName:
        of "accessory", "accessories":
            if result.apiName == "accessories":
                result.filters = @["field_list", "limit", "offset", "sort",
                                   "filter"]
            result.fieldList = newFieldList(apiDetailUrl, added, lastUpdated,
                                            summary, desc, id, image, name,
                                            siteDetailUrl)
        of "character":
            result.fieldList = newFieldList(aliases, apiDetailUrl, birthday,
                                            concepts, added, lastUpdated, summary,
                                            desc, enemies, firstInGame, franchises,
                                            friends, games, gender, id, image,
                                            lastName, locations, name, objects,
                                            people, realName,
                                            siteDetailUrl)
        of "characters":
            result.filters = @["field_list", "limit", "offset", "sort",
                               "filter"]
            result.fieldList = newFieldList(aliases, apiDetailUrl, birthday,
                                            added, lastUpdated, summary, desc, 
                                            firstInGame, gender, id, image, 
                                            lastName, name, realName,
                                            siteDetailUrl)
        of "chat", "chats":
            result.fieldList = newFieldList(apiDetailUrl, channelName, summary,
                                            image, password, siteDetailUrl, title)
        of "company", "companies":
            if result.apiName == "companies":
                result.filters = @["field_list", "limit", "offset", "sort",
                                   "filter"]
            result.fieldList = newFieldList(abbreviation, aliases, apiDetailUrl,
                                            characters, concepts, added, founded,
                                            lastUpdated, summary, desc, devGames,
                                            devReleases, distReleases, id, image,
                                            locAddress, locCity, locState, locCountry,
                                            locations, name, objects, people, phone, 
                                            pubGames, pubReleases, siteDetailUrl, website)
        of "concept":
            result.fieldList = newFieldList(aliases, apiDetailUrl, characters,
                                            concepts, added, lastUpdated, summary, desc,
                                            firstFranchise, firstInGame, franchises, 
                                            games, id, image, locations, name, objects,
                                            people, relatedCons, siteDetailUrl)
        of "concepts":
            result.filters = @["field_list", "limit", "offset", "sort",
                               "filter"]
            result.fieldList = newFieldList(aliases, apiDetailUrl, added, lastUpdated,
                                            summary, desc, firstFranchise, firstInGame, 
                                            id, image, name, siteDetailUrl)
        of "dlc", "dlcs":
            if result.apiName == "dlcs":
                result.filters = @["field_list", "limit", "offset", "sort",
                                   "filter"]
            result.fieldList = newFieldList(apiDetailUrl, added, lastUpdated, summary,
                                            desc, game, id, image, name, platform,
                                            releaseDate, siteDetailUrl)
        of "error":
            result.fieldList = newFieldList(name, error)
        of "franchise":
            result.fieldList = newFieldList(aliases, apiDetailUrl, characters, concepts,
                                            added, lastUpdated, summary, desc, games,
                                            id, image, locations, name, objects,
                                            people, siteDetailUrl)
        of "franchises":
            result.filters = @["field_list", "limit", "offset", "sort",
                               "filter"]
            result.fieldList = newFieldList(aliases, apiDetailUrl, added, lastUpdated,
                                            summary, desc, id, image, name,
                                            siteDetailUrl)
        of "game":
            result.fieldList = newFieldList(aliases, apiDetailUrl, characters, concepts,
                                            added, lastUpdated, summary, desc, devs,
                                            expReleaseDay, expReleaseMon, expReleaseQrtr,
                                            expReleaseYear, firstChars, firstConcepts,
                                            firstLocs, firstObjects, firstPeople, firstInGame,
                                            franchises, genres, id, image, images,
                                            killedChars, locations, name, amtUserReviews,
                                            objects, origGameRating, origRlsDate, people,
                                            platforms, publishers, releases, dlcs, reviews,
                                            similarGames, siteDetailUrl, themes, videos)
        of "games":
            result.filters = @["field_list", "limit", "offset", "platforms",
                               "sort", "filter"]
            result.fieldList = newFieldList(aliases, apiDetailUrl, added, 
                                            lastUpdated, summary, desc, expReleaseMon, 
                                            expReleaseQrtr, expReleaseYear, image, name,
                                            amtUserReviews,origGameRating, origRlsDate,
                                            platforms, siteDetailUrl)
        of "game_rating", "game_ratings":
            if result.apiName == "game_ratings":
                result.filters = @["field_list", "limit", "offset", "sort",
                                   "filter"]
            result.fieldList = newFieldList(apiDetailUrl, id, image, name, ratingBoard)
        of "genre", "genres":
            if result.apiName == "genres":
                result.filters = @["field_list", "limit", "offset"]
            result.fieldList = newFieldList(apiDetailUrl, added, lastUpdated,
                                            summary, desc, id, image, name,
                                            siteDetailUrl)
        of "image":
            result.fieldList = newFieldList(iconUrl, mediumUrl, screenUrl, screenLargeUrl,
                                            smallUrl, superUrl, thumbUrl, tinyUrl)
        of "location", "locations":
            if result.apiName == "locations":
                result.filters = @["field_list", "limit", "offset"]
            result.fieldList = newFieldList(aliases, apiDetailUrl, added, lastUpdated,
                                            summary, desc, id, image, name,
                                            siteDetailUrl)
        of "object":
            result.fieldList = newFieldList(aliases, apiDetailUrl, characters,
                                            companies, concepts, added, lastUpdated, summary, desc,
                                            firstInGame, franchises, games, id, image,
                                            locations, name, objects, people,
                                            siteDetailUrl)
        of "objects":
            result.filters = @["field_list", "limit", "offset", "sort",
                               "filter"]
            result.fieldList = newFieldList(aliases, apiDetailUrl, added, lastUpdated,
                                            summary, desc, firstInGame, id, image,
                                            name, siteDetailUrl)
        of "person":
            result.fieldList = newFieldList(aliases, apiDetailUrl, birthday, characters,
                                            concepts, country, added, lastUpdated,
                                            deathDate, summary, desc, firstCreditIn,
                                            franchises, games, gender, hometown, id,
                                            image, locations, name, objects, people,
                                            siteDetailUrl)
        of "people":
            result.filters = @["field_list", "limit", "offset", "sort",
                               "filter"]
            result.fieldList = newFieldList(aliases, apiDetailUrl, birthday, country,
                                            added, lastUpdated, deathDate, summary,
                                            desc, firstCreditIn, gender, hometown, id,
                                            image, name, siteDetailUrl)
        of "platform", "platforms":
            if result.apiName == "platforms":
                result.filters = @["field_list", "limit", "offset", "sort",
                                   "filter"]
            result.fieldList = newFieldList(abbreviation, apiDetailUrl, company, added,
                                            lastUpdated, summary, desc, id, image,
                                            installBase, name, onlineSupport, origPrice,
                                            releaseDate, siteDetailUrl)
        of "promo", "promos":
            if result.apiName == "promos":
                result.filters = @["field_list", "limit", "offset", "sort",
                                   "filter"]
            result.fieldList = newFieldList(apiDetailUrl, added, summary,
                                            id, image, link, name,
                                            resourceType, user)
        of "rating_board", "rating_boards":
            if result.apiName == "raing_boards":
                result.filters = @["field_list", "limit", "offset", "sort",
                                   "filter"]
            result.fieldList = newFieldList(apiDetailUrl, added, lastUpdated,
                                            summary, desc, id, image, name,
                                            region, siteDetailUrl)
        of "region":
            result.fieldList = newFieldList(apiDetailUrl, added, lastUpdated,
                                            summary, desc, id, image, name,
                                            siteDetailUrl)    
        of "regions":
            result.filters = @["field_list", "limit", "offset", "sort",
                                "filter"]
            result.fieldList = newFieldList(apiDetailUrl, added, lastUpdated,
                                            summary, desc, id, image, name,
                                            siteDetailUrl)
        of "release", "releases":
            if result.apiName == "releases":
                result.filters = @["field_list", "limit", "offset", "platforms",
                                   "sort", "filter"]
            result.fieldList = newFieldList(apiDetailUrl, added, lastUpdated,
                                            summary, desc, expReleaseDay,
                                            expReleaseMon, expReleaseQrtr,
                                            expReleaseYear, game, gameRating,
                                            id, image, maxPlayers, minPlayers,
                                            multiFeatures, name, platform,
                                            prodCodeType, prodCodeVal, region,
                                            releaseDate, resolutions, spFeatures,
                                            soundSystems, siteDetailUrl,
                                            widescreen)
        of "review":
            result.fieldList = newFieldList(apiDetailUrl, summary, desc, dlcName,
                                            game, platforms, publishDate, release,
                                            reviewer, score, siteDetailUrl)
        of "reviews":
            result.filters = @["field_list", "limit", "offset", "sort",
                               "filter"]
            result.fieldList = newFieldList(apiDetailUrl, summary, desc, dlcName,
                                            game, publishDate, release, reviewer,
                                            score, siteDetailUrl)
        of "search":
            result.filters = @["field_list", "limit", "page", "query",
                               "resources", "subscriber_only"]
            result.fieldList = newFieldList(resourceType)
        of "theme", "themes":
            if result.apiName == "themes":
                result.filters = @["field_list", "limit", "offset", "sort",
                                   "filter"]
            result.fieldList = newFieldList(apiDetailUrl, id, name,
                                            siteDetailUrl)
        of "type", "types":
            result.filters = @[]
            result.fieldList = newFieldList(detailResName, id, listResName)
        of "theme, themes":
            if result.apiName == "themes":
                result.filters = @["field_list", "limit", "offset", "sort",
                                   "filter"]
            result.fieldList = newFieldList(apiDetailUrl, id, name,
                                            siteDetailUrl)
        of "user_review", "user_reviews":
            if result.apiName == "user_reviews":
                result.filters = @["field_list", "limit", "offset", "sort",
                                   "filter", "game"]
            result.fieldList = newFieldList(apiDetailUrl, added, lastUpdated,
                                            summary, desc, game, reviewer,
                                            score, siteDetailUrl)
        # TODO: Finish this.




proc getRes*(field: Field): Resource =
    ## Gets the resource content of a field if its of type fkRes.
    ## Otherwise returns an "error" resource.
    if field.kind != fkRes:
        result = newResource("error")
    else:
        result = field.resContent


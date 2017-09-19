# Defines the resources and fields contained within a request.

import sequtils, strutils
import nbtypes
import nbfield
import "../nbfieldlist", "../nbresourcelist"

export Resource, FieldList, ResourceType

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
            result.fieldList = newFieldList(apiDetailUrl, dateAdded, dateLastUpdated,
                                            deck, description, id, image, name,
                                            siteDetailUrl)
        of "character":
            result.fieldList = newFieldList(aliases, apiDetailUrl, birthday,
                                            concepts, dateAdded, dateLastUpdated, deck,
                                            description, enemies, firstAppearedInGame, franchises,
                                            friends, games, gender, id, image,
                                            lastName, locations, name, objects,
                                            people, realName,
                                            siteDetailUrl)
        of "characters":
            result.filters = @["field_list", "limit", "offset", "sort",
                               "filter"]
            result.fieldList = newFieldList(aliases, apiDetailUrl, birthday,
                                            dateAdded, dateLastUpdated, deck, description, 
                                            firstAppearedInGame, gender, id, image, 
                                            lastName, name, realName,
                                            siteDetailUrl)
        of "chat", "chats":
            result.fieldList = newFieldList(apiDetailUrl, channelName, deck,
                                            image, password, siteDetailUrl, title)
        of "company", "companies":
            if result.apiName == "companies":
                result.filters = @["field_list", "limit", "offset", "sort",
                                   "filter"]
            result.fieldList = newFieldList(abbreviation, aliases, apiDetailUrl,
                                            characters, concepts, dateAdded, dateFounded,
                                            dateLastUpdated, deck, description, developedGames,
                                            developerReleases, distributorReleases, id, image,
                                            locationAddress, locationCity, locationState, locationCountry,
                                            locations, name, objects, people, phone, 
                                            publishedGames, publishedReleases, siteDetailUrl, website)
        of "concept":
            result.fieldList = newFieldList(aliases, apiDetailUrl, characters,
                                            concepts, dateAdded, dateLastUpdated, deck, description,
                                            firstAppearedInFranchise, firstAppearedInGame, franchises, 
                                            games, id, image, locations, name, objects,
                                            people, relatedConcepts, siteDetailUrl)
        of "concepts":
            result.filters = @["field_list", "limit", "offset", "sort",
                               "filter"]
            result.fieldList = newFieldList(aliases, apiDetailUrl, dateAdded, dateLastUpdated,
                                            deck, description, firstAppearedInFranchise, firstAppearedInGame, 
                                            id, image, name, siteDetailUrl)
        of "dlc", "dlcs":
            if result.apiName == "dlcs":
                result.filters = @["field_list", "limit", "offset", "sort",
                                   "filter"]
            result.fieldList = newFieldList(apiDetailUrl, dateAdded, dateLastUpdated, deck,
                                            description, game, id, image, name, platform,
                                            releaseDate, siteDetailUrl)
        of "error":
            result.fieldList = newFieldList(name, error)
        of "franchise":
            result.fieldList = newFieldList(aliases, apiDetailUrl, characters, concepts,
                                            dateAdded, dateLastUpdated, deck, description, games,
                                            id, image, locations, name, objects,
                                            people, siteDetailUrl)
        of "franchises":
            result.filters = @["field_list", "limit", "offset", "sort",
                               "filter"]
            result.fieldList = newFieldList(aliases, apiDetailUrl, dateAdded, dateLastUpdated,
                                            deck, description, id, image, name,
                                            siteDetailUrl)
        of "game":
            result.fieldList = newFieldList(aliases, apiDetailUrl, characters, concepts,
                                            dateAdded, dateLastUpdated, deck, description, developers,
                                            expectedReleaseDay, expectedReleaseMonth, expectedReleaseQuarter,
                                            expectedReleaseYear, firstAppearanceCharacters, firstAppearanceConcepts,
                                            firstAppearanceLocations, firstAppearanceObjects, firstAppearancePeople, firstAppearedInGame,
                                            franchises, genres, id, image, images,
                                            killedCharacters, locations, name, numberOfUserReviews,
                                            objects, originalGameRating, originalReleaseDate, people,
                                            platforms, publishers, releases, dlcs, reviews,
                                            similarGames, siteDetailUrl, themes, videos)
        of "games":
            result.filters = @["field_list", "limit", "offset", "platforms",
                               "sort", "filter"]
            result.fieldList = newFieldList(aliases, apiDetailUrl, dateAdded, 
                                            dateLastUpdated, deck, description, expectedReleaseMonth, 
                                            expectedReleaseQuarter, expectedReleaseYear, image, name,
                                            numberOfUserReviews,originalGameRating, originalReleaseDate,
                                            platforms, siteDetailUrl)
        of "game_rating", "game_ratings":
            if result.apiName == "game_ratings":
                result.filters = @["field_list", "limit", "offset", "sort",
                                   "filter"]
            result.fieldList = newFieldList(apiDetailUrl, id, image, name, ratingBoard)
        of "genre", "genres":
            if result.apiName == "genres":
                result.filters = @["field_list", "limit", "offset"]
            result.fieldList = newFieldList(apiDetailUrl, dateAdded, dateLastUpdated,
                                            deck, description, id, image, name,
                                            siteDetailUrl)
        of "image":
            result.fieldList = newFieldList(iconUrl, mediumUrl, screenUrl, screenLargeUrl,
                                            smallUrl, superUrl, thumbUrl, tinyUrl)
        of "location", "locations":
            if result.apiName == "locations":
                result.filters = @["field_list", "limit", "offset"]
            result.fieldList = newFieldList(aliases, apiDetailUrl, dateAdded, dateLastUpdated,
                                            deck, description, id, image, name,
                                            siteDetailUrl)
        of "object":
            result.fieldList = newFieldList(aliases, apiDetailUrl, characters,
                                            companies, concepts, dateAdded, dateLastUpdated, deck, description,
                                            firstAppearedInGame, franchises, games, id, image,
                                            locations, name, objects, people,
                                            siteDetailUrl)
        of "objects":
            result.filters = @["field_list", "limit", "offset", "sort",
                               "filter"]
            result.fieldList = newFieldList(aliases, apiDetailUrl, dateAdded, dateLastUpdated,
                                            deck, description, firstAppearedInGame, id, image,
                                            name, siteDetailUrl)
        of "person":
            result.fieldList = newFieldList(aliases, apiDetailUrl, birthday, characters,
                                            concepts, country, dateAdded, dateLastUpdated,
                                            deathDate, deck, description, firstCreditedGame,
                                            franchises, games, gender, hometown, id,
                                            image, locations, name, objects, people,
                                            siteDetailUrl)
        of "people":
            result.filters = @["field_list", "limit", "offset", "sort",
                               "filter"]
            result.fieldList = newFieldList(aliases, apiDetailUrl, birthday, country,
                                            dateAdded, dateLastUpdated, deathDate, deck,
                                            description, firstCreditedGame, gender, hometown, id,
                                            image, name, siteDetailUrl)
        of "platform", "platforms":
            if result.apiName == "platforms":
                result.filters = @["field_list", "limit", "offset", "sort",
                                   "filter"]
            result.fieldList = newFieldList(abbreviation, apiDetailUrl, company, dateAdded,
                                            dateLastUpdated, deck, description, id, image,
                                            installBase, name, onlineSupport, originalPrice,
                                            releaseDate, siteDetailUrl)
        of "promo", "promos":
            if result.apiName == "promos":
                result.filters = @["field_list", "limit", "offset", "sort",
                                   "filter"]
            result.fieldList = newFieldList(apiDetailUrl, dateAdded, deck,
                                            id, image, link, name,
                                            resourceType, user)
        of "rating_board", "rating_boards":
            if result.apiName == "raing_boards":
                result.filters = @["field_list", "limit", "offset", "sort",
                                   "filter"]
            result.fieldList = newFieldList(apiDetailUrl, dateAdded, dateLastUpdated,
                                            deck, description, id, image, name,
                                            region, siteDetailUrl)
        of "region":
            result.fieldList = newFieldList(apiDetailUrl, dateAdded, dateLastUpdated,
                                            deck, description, id, image, name,
                                            siteDetailUrl)    
        of "regions":
            result.filters = @["field_list", "limit", "offset", "sort",
                                "filter"]
            result.fieldList = newFieldList(apiDetailUrl, dateAdded, dateLastUpdated,
                                            deck, description, id, image, name,
                                            siteDetailUrl)
        of "release", "releases":
            if result.apiName == "releases":
                result.filters = @["field_list", "limit", "offset", "platforms",
                                   "sort", "filter"]
            result.fieldList = newFieldList(apiDetailUrl, dateAdded, dateLastUpdated,
                                            deck, description, expectedReleaseDay,
                                            expectedReleaseMonth, expectedReleaseQuarter,
                                            expectedReleaseYear, game, gameRating,
                                            id, image, maximumPlayers, minimumPlayers,
                                            multiplayerFeatures, name, platform,
                                            productCodeType, productCodeValue, region,
                                            releaseDate, resolutions, singlePlayerFeatures,
                                            soundSystem, siteDetailUrl,
                                            widescreenSupport)
        of "review":
            result.fieldList = newFieldList(apiDetailUrl, deck, description, dlcName,
                                            game, platforms, publishDate, release,
                                            reviewer, score, siteDetailUrl)
        of "reviews":
            result.filters = @["field_list", "limit", "offset", "sort",
                               "filter"]
            result.fieldList = newFieldList(apiDetailUrl, deck, description, dlcName,
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
            result.fieldList = newFieldList(detailResourceName, id, listResourceName)
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
            result.fieldList = newFieldList(apiDetailUrl, dateAdded, dateLastUpdated,
                                            deck, description, game, reviewer,
                                            score, siteDetailUrl)
        # TODO: Finish this.

proc newResource*(resType: ResourceType): Resource =
    result = newResource($resType)

proc getField*(resource: Resource, name: string): Field =
    ## Tries to get a field based on the name passed.
    ## Returns an "error" field if it doesn't exist.
    for field in resource.fieldList:
        if field.apiName == name:
            return field

    result = Field(apiName: "error", kind: fkStr)
    result.setContent("Err: Field not yet implemented") #??

proc getField*(resource: Resource, field: FieldObj): Field =
    ## Tries to get a field based on the api name of the field passed.
    ## Returns an "error" field if it doesn't exist.
    result = getField(resource, field.apiName) 

proc hasField*(resource: Resource, has: FieldObj): bool =
    result = resource.getField(has.apiName).apiName != "error"

proc getRes*(field: Field): Resource =
    ## Gets the resource content of a field if its of type fkRes.
    ## Otherwise returns an "error" resource.
    if field.kind != fkRes:
        result = newResource("error")
    else:
        result = field.resContent


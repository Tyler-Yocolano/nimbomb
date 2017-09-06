# Defines the resources and fields contained within a request.

import sequtils, strutils
include resourcetypes

# - Type definitions
type
    FieldKind* = enum
        ## Determines the type of content a field will hold.
        fkStr,  ## Init string field
        fkInt,  ## Init int field
        fkRes   ## Init Resource field

    Field* = ref FieldObject

    FieldObject* = object
        ## The fields that are contained within a response.
        apiName*: string             ## Usually a Camel-cased version of GB's 
                                     ## name for the field.
        sortable*, filterable*: bool ## Whether the fields can be sorted
                                     ## or filtered in a search.
        case kind: FieldKind
            of fkStr: strContent: string
            of fkInt: intContent: int
            of fkRes: 
                resContent: Resource

    ResourceRef* = ref Resource

    Resource* = object
        ## Holds the objects converted from Json Objects
        apiName*: string        ## Usually a Camel-cased version of GB's 
                                ## name for the field.
        filters*: seq[string]   ## The types of filters that can be used
                                ## during a search.
        fieldList*: FieldList   ## The fields that will appear for the
                                ## object.
        resourceType*: ResourceType 

    FieldList* = seq[Field]


# - Type procedures

proc newField*(apiName: string, sortable, filterable: bool = false,
               fKind: FieldKind = fkStr): FieldObject =
    result.apiName = apiName
    result.sortable = sortable
    result.filterable = filterable
    result.kind = fKind

proc newFieldList(foList: varargs[FieldObject]) : FieldList =
    result = @[]
    for fo in foList:
        var f = new(Field)
        f.apiName = fo.apiName
        f.filterable = fo.filterable
        f.kind = fo.kind
        f.sortable = fo.sortable
        result.add(f)

proc setContent*(field: Field, content: string | int | Resource) =
    ## Sets the contents of the field based on the FieldKind
    when content is string:
        if field.kind == fkStr:
            field.strContent = content
    when content is int:
        if field.kind == fkInt:
            field.intContent = content
    when content is Resource:
        if field.kind == fkRes:
            field.resContent = content

proc getFieldListNames(fl: FieldList): seq[string] =
    ## Returns the names of the fields within the list.
    result = @[]
    for f in fl:
        result.add(f.apiName)

# - Field variables.
#
# Initiated here to help create and search for resources
let
    abbreviation*   = newField("abbreviation")
    aliases*        = newField("aliases", filterable = true)
    apiDetailUrl*   = newField("api_detail_url")
    birthday*       = newField("birth_date", true, true)
    characters*     = newField("characters", fKind = fkRes)
    channelName*    = newField("channel_name")
    concepts*       = newField("concepts", fKind = fkRes)
    company*        = newField("company", fKind = fkRes)
    companies*      = newField("companies", fKind = fkRes)
    country*        = newField("country", true, true)
    added*          = newField("date_added", true, true)
    founded*        = newField("date_founded", true, true)
    lastUpdated*    = newField("date_last_updated", true, true)
    deathDate*      = newField("death_date", true, true)
    summary*        = newField("deck")
    desc*           = newField("description")
    detailResName*  = newField("detail_resource_name")
    devs*           = newField("developers")
    devGames*       = newField("developed_games")
    devReleases*    = newField("developer_releases")
    distReleases*   = newField("distributor_releases")
    dlcName*        = newField("dlc_name")
    enemies*        = newField("enemies")
    expReleaseDay*  = newField("expected_release_day")
    expReleaseMon*  = newField("expected_release_month", filterable = true)
    expReleaseQrtr* = newField("expected_release_quarter", filterable = true)
    expReleaseYear* = newField("expected_release_year", filterable = true)
    firstFranchise* = newField("first_appeared_in_franchise")
    firstChars*     = newField("first_appearance_characters")
    firstConcepts*  = newField("first_appearance_concepts")
    firstInGame*    = newField("first_appeared_in_game")
    firstLocs*      = newField("first_appearance_locations")
    firstObjects*   = newField("first_appearance_objects")
    firstPeople*    = newField("first_appearance_people")
    firstCreditIn*  = newField("first_credited_game", fKind = fkRes)
    franchises*     = newField("franchises", fKind = fkRes)
    friends*        = newField("friends")
    game*           = newField("game", filterable = true, fKind = fkRes)
    gameRating*     = newField("game_rating")
    games*          = newField("games", fkind = fkRes)
    genres*         = newField("genres")
    gender*         = newField("gender", true, true)
    hometown*       = newField("hometown", true, true)
    id*             = newField("id", true, true, fkInt)
    image*          = newField("image")
    images*         = newField("images")
    installBase*    = newField("install_base", true, true)
    killedChars*    = newField("killed_characters")
    lastName*       = newField("last_name")
    link*           = newField("link")
    listResName*    = newField("list_resource_name")
    locAddress*     = newField("location_address")
    locCity*        = newField("location_city")
    locCountry*     = newField("location_country")
    locState*       = newField("location_state")
    locations*      = newField("locations", fKind = fkRes)
    maxPlayers*     = newField("maximum_players")
    minPlayers*     = newField("minimum_players")
    multiFeatures*  = newField("multiplayer_features")
    name*           = newField("name", true, true)
    amtUserReviews* = newField("number_of_user_reviews")
    objects*        = newField("objects", fkind = fkRes)
    origGameRating* = newField("original_game_rating")
    origRlsDate*    = newField("original_release_date")
    onlineSupport*  = newField("online_support", true, true)
    origPrice*      = newField("original_price", true, true)
    password*       = newField("password")
    people*         = newField("people", fkind = fkRes)
    phone*          = newField("phone")
    platform*       = newField("platform", true, true, fkRes)
    platforms*      = newField("platforms", fKind = fkRes)
    prodCodeType*   = newField("product_code_type")
    prodCodeVal*    = newField("product_code_value")
    pubGames*       = newField("published_games")
    pubReleases*    = newField("published_releases")
    publishers*     = newField("publishers")
    publishDate*    = newFIeld("publish_date")
    ratingBoard*    = newField("rating_board", true, true, fkRes)
    realName*       = newField("real_name")
    region*         = newField("region", fKind = fkRes)
    relatedCons*    = newField("related_concepts")
    releaseDate*    = newField("release_date", sortable = true)
    release*        = newField("release")
    releases*       = newField("releases", fKind = fkRes)
    resolutions*    = newField("resolutions")
    resourceType*   = newField("resource_type")
    reviewer*       = newField("reviewer")
    dlcs*           = newField("dlcs", fKind = fkRes)
    reviews*        = newField("reviews", fKind = fkRes)
    score*          = newField("score")
    similarGames*   = newField("similarGames")
    siteDetailUrl*  = newField("site_detail_url")
    soundSystems*   = newField("sound_system")
    spFeatures*     = newField("singleplayer_features")
    title*          = newField("title")
    themes*         = newField("themes", fKind = fkRes)
    website*        = newField("website")
    user*           = newField("user")
    videos*         = newField("videos", fKind = fkRes)
    widescreen*     = newField("widescreen_support")

# Yowza..

proc newResource*(resType: ResourceType): Resource =
    ## Creates a new resource and fills in the field list based on its type.
    result.apiName = $resType
    result.filters = @["field_list"]
    result.resourceType = resType

    case result.apiName:
        of "accessory", "accessories":
            if result.apiName == "accessories":
                result.filters = @["field_list", "limit", "offset", "sort",
                                   "filter"]
            result.fieldList = newFieldList(apiDetailUrl, added, lastUpdated,
                                 summary, desc, id, image, name, siteDetailUrl)
        of "character":
            result.fieldList = newFieldList(aliases, apiDetailUrl, birthday,
                                 concepts, added, lastUpdated, summary, desc,
                                 enemies, firstInGame, franchises, friends,
                                 games, gender, id, image, lastName, locations,
                                 name, objects, people, realName,
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
        of "franchise":
            result.fieldList = newFieldList(aliases, apiDetailUrl, characters, concepts,
                                 added, lastUpdated, summary, desc, games,
                                 id, image, locations, name, objects,
                                 people, siteDetailUrl)
        of "franchises":
            result.filters = @["field_list", "limit", "offset", "sort",
                               "filter"]
            result.fieldList = newFieldList(aliases, apiDetailUrl, added, lastUpdated,
                                 summary, desc, id, image, name, siteDetailUrl)
        of "game":
            result.fieldList = newFieldList(aliases, apiDetailUrl, characters, concepts,
                                 added, lastUpdated, summary, desc, devs,
                                 expReleaseDay, expReleaseMon, expReleaseQrtr,
                                 expReleaseYear, firstChars, firstConcepts,
                                 firstLocs, firstObjects, firstPeople,
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
        of "location", "locations":
            if result.apiName == "locations":
                result.filters = @["field_list", "limit", "offset"]
            result.fieldList = newFieldList(aliases, apiDetailUrl, added, lastUpdated,
                                 summary, desc, id, image, name,
                                 siteDetailUrl)
        of "object":
            result.fieldList = newFieldList(aliases, apiDetailUrl, characters, companies,
                                 concepts, added, lastUpdated, summary, desc,
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

proc newResource*(resType: string): Resource =
    ## Helper for creating a resource from a string.
    ## Will create an 'Error' resource if the string doesn't match
    ## to a ResourceType.
    for t in ResourceType.items:
        if $t == resType:
            return newResource(t)
    return newResource(rtError)

proc getStr*(field: Field): string =
    if field.kind != fkStr:
        result = ""
    else:
        result = field.strContent

proc getInt*(field: Field): int =
    if field.kind != fkInt:
        result = 0
    else:
        result = field.intContent

proc getRes*(field: Field): Resource =
    if field.kind != fkRes:
        result = newResource(rtError)
    else:
        result = field.resContent

proc getField*(fl: FieldList, field: FieldObject): Field =
    result = filter(fl, proc(x: Field): bool = x.apiName == field.apiName)[0]
proc getField*(fl: FieldList, name: string): Field =
    result = filter(fl, proc(x: Field): bool = x.apiName == name)[0]

proc `$`*(resource: Resource): string =
    try:
        result = resource.fieldList.getField(name).strContent
    except:
        result = ""
proc `$`*(field: Field): string =
    case field.kind:
        of fkStr:
            result = field.strContent
        of fkInt:
            result = $field.intContent
        of fkRes:
            result = $field.resContent 

import nbtypes

proc newField*(apiName: string, sortable, filterable: bool = false,
               fKind: FieldKind = fkStr): FieldObject =
    result.apiName = apiName
    result.sortable = sortable
    result.filterable = filterable
    result.kind = fKind

proc newField*(apiName: string, arrKind: string, sortable,
               filterable: bool = false): FieldObject =
    result.apiName = apiName
    result.sortable = sortable
    result.filterable = filterable
    result.kind = fkArr
    result.arrKind = arrKind

proc newFieldList*(foList: varargs[FieldObject]) : FieldList =
    result = @[]
    for fo in foList:
        var f = new(Field)
        f.apiName = fo.apiName
        f.filterable = fo.filterable
        f.kind = fo.kind
        f.sortable = fo.sortable
        result.add(f)

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
    characters*     = newField("characters", "character")
    channelName*    = newField("channel_name")
    concepts*       = newField("concepts", "concept")
    company*        = newField("company", fKind = fkRes)
    companies*      = newField("companies", "company")
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
    firstChars*     = newField("first_appearance_characters", "character")
    firstConcepts*  = newField("first_appearance_concepts", "concept")
    firstInGame*    = newField("first_appeared_in_game", "game")
    firstLocs*      = newField("first_appearance_locations", "location")
    firstObjects*   = newField("first_appearance_objects", "objet")
    firstPeople*    = newField("first_appearance_people", "person")
    firstCreditIn*  = newField("first_credited_game", fKind = fkRes)
    franchises*     = newField("franchises", "franchise")
    friends*        = newField("friends", fkind = fkRes)
    game*           = newField("game", filterable = true, fKind = fkRes)
    gameRating*     = newField("game_rating")
    games*          = newField("games", "game")
    genres*         = newField("genres", "genre")
    gender*         = newField("gender", true, true, fkind = fkInt)
    hometown*       = newField("hometown", true, true)
    id*             = newField("id", true, true, fkInt)
    image*          = newField("image", fKind = fkRes)
    images*         = newField("images", "image")
    installBase*    = newField("install_base", true, true)
    killedChars*    = newField("killed_characters", "character")
    lastName*       = newField("last_name")
    link*           = newField("link")
    listResName*    = newField("list_resource_name")
    locAddress*     = newField("location_address")
    locCity*        = newField("location_city")
    locCountry*     = newField("location_country")
    locState*       = newField("location_state")
    locations*      = newField("locations", "location")
    maxPlayers*     = newField("maximum_players", fkind = fkInt)
    minPlayers*     = newField("minimum_players", fkind = fkInt)
    multiFeatures*  = newField("multiplayer_features")
    nameField*      = newField("name", true, true)
    amtUserReviews* = newField("number_of_user_reviews", fkind = fkInt)
    objects*        = newField("objects", "object")
    origGameRating* = newField("original_game_rating", "game_rating")
    origRlsDate*    = newField("original_release_date")
    onlineSupport*  = newField("online_support", true, true)
    origPrice*      = newField("original_price", true, true)
    password*       = newField("password")
    people*         = newField("people", "person")
    phone*          = newField("phone")
    platform*       = newField("platform", true, true, fkRes)
    platforms*      = newField("platforms", "platform")
    prodCodeType*   = newField("product_code_type")
    prodCodeVal*    = newField("product_code_value")
    pubGames*       = newField("published_games")
    pubReleases*    = newField("published_releases")
    publishers*     = newField("publishers", "publisher")
    publishDate*    = newFIeld("publish_date")
    ratingBoard*    = newField("rating_board", true, true, fkRes)
    realName*       = newField("real_name")
    region*         = newField("region", fKind = fkRes)
    relatedCons*    = newField("related_concepts")
    releaseDate*    = newField("release_date", sortable = true)
    release*        = newField("release", fkind = fkRes)
    releases*       = newField("releases", "release")
    resolutions*    = newField("resolutions")
    resourceType*   = newField("resource_type")
    reviewer*       = newField("reviewer")
    dlcs*           = newField("dlcs", fKind = fkRes)
    reviews*        = newField("reviews", fKind = fkRes)
    score*          = newField("score")
    similarGames*   = newField("similarGames", "game")
    siteDetailUrl*  = newField("site_detail_url")
    soundSystems*   = newField("sound_system")
    spFeatures*     = newField("singleplayer_features")
    title*          = newField("title")
    themes*         = newField("themes", "theme")
    website*        = newField("website")
    user*           = newField("user")
    videos*         = newField("videos", "video")
    widescreen*     = newField("widescreen_support")

    # Image only fields
    iconUrl*        = newField("icon_url")
    mediumUrl*      = newField("medium_url")
    screenUrl*      = newField("screen_url")
    screenLargeUrl* = newField("screen_large_url")
    smallUrl*       = newField("small_url")
    superUrl*       = newField("super_url")
    thumbUrl*       = newField("thumb_url")
    tinyUrl*        = newField("tiny_url")
# Yowza..

proc getField*(fl: FieldList, name: string): Field =
    ## Tries to get a field based on the name passed.
    ## Returns an "error" field if it doesn't exist.
    for field in fl:
        if field.apiName == name:
            return field 

    result = Field(apiName: "error", kind: fkStr)
    result.setContent("This field does not exist") #??

proc getField*(fl: FieldList, field: FieldObject): Field =
    ## Tries to get a field based on the api name of the field passed.
    ## Returns an "error" field if it doesn't exist.
    result = getField(fl, field.apiName) 

proc `$`*(field: Field): string =
    case field.kind:
        of fkStr:
            result = field.getStr()
        of fkInt:
            result = $field.getInt()
        of fkRes:
            result = $field.getRes()
        of fkArr:
            result = field.arrKind
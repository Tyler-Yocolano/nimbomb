import nbtypes

export Field, FieldKind

proc setContent*(field: Field, content: string | int | Resource | seq[Resource]) =
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
    when content is seq[Resource]:
        if field.kind == fkArr:
            field.arrContent = content

proc getStr*(field: Field): string =
    ## Gets the string content of a field if its of type fkStr.
    try:
        result = field.strContent
    except:
        result = "Empty"

proc getInt*(field: Field): int =
    ## Gets the interger content of a field if its of type fkInt.
    try:
        result = field.intContent
    except:
        result = 0

proc getArr*(field: Field): seq[Resource] =
    ## Gets the sequence of Resrouces held by this field if its of type fkArr.
    try:
        result = field.arrContent
    except:
        result = @[]

proc newField*(apiName: string, sortable, filterable: bool = false,
               fKind: FieldKind = fkStr): FieldObj =
    ## Creates a Field object.
    ## Use `arrKind = "string"` to make an array field.
    if fKind == fkArr:
        raise newException(Exception, "Specify an arrKind using the other newField proc.")
    result.apiName = apiName
    result.sortable = sortable
    result.filterable = filterable
    result.kind = fKind

proc newField*(apiName: string, arrKind: string, sortable,
               filterable: bool = false): FieldObj =
    ## Creates an fkArr kind of Field object.
    result.apiName = apiName
    result.sortable = sortable
    result.filterable = filterable
    result.kind = fkArr
    result.arrKind = arrKind

proc newFieldList*(foList: varargs[FieldObj]) : FieldList =
    result = @[]
    for fo in foList:
        var f = new(Field)
        f.apiName = fo.apiName
        f.kind = fo.kind
        f.sortable = fo.sortable
        f.filterable = fo.filterable
        if f.kind == fkArr:
            f.arrKind = fo.arrKind
        result.add(f)

proc getField*(fl: FieldList, name: string): Field =
    ## Tries to get a field based on the name passed.
    ## Returns an "error" field if it doesn't exist.
    for field in fl:
        if field.apiName == name:
            return field

    result = Field(apiName: "error", kind: fkStr)
    result.setContent("This field does not exist") #??

proc getField*(fl: FieldList, field: FieldObj): Field =
    ## Tries to get a field based on the api name of the field passed.
    ## Returns an "error" field if it doesn't exist.
    result = getField(fl, field.apiName) 

proc hasField*(fl: FieldList, has: string): bool =
    result = fl.getField(has).apiName != "error"

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
    devs*           = newField("developers", "company")
    devGames*       = newField("developed_games")
    devReleases*    = newField("developer_releases")
    distReleases*   = newField("distributor_releases")
    dlcName*        = newField("dlc_name")
    enemies*        = newField("enemies")
    expReleaseDay*  = newField("expected_release_day")
    expReleaseMon*  = newField("expected_release_month", filterable = true)
    expReleaseQrtr* = newField("expected_release_quarter", filterable = true)
    expReleaseYear* = newField("expected_release_year", filterable = true)
    error*          = newField("error")
    firstFranchise* = newField("first_appeared_in_franchise")
    firstChars*     = newField("first_appearance_characters", "character")
    firstConcepts*  = newField("first_appearance_concepts", "concept")
    firstInGame*    = newField("game", fKind = fkRes)
    firstLocs*      = newField("first_appearance_locations", "location")
    firstObjects*   = newField("first_appearance_objects", "object")
    firstPeople*    = newField("first_appearance_people", "person")
    firstCreditIn*  = newField("first_credited_game", fKind = fkRes)
    franchises*     = newField("franchises", "franchise")
    friends*        = newField("friends", fkind = fkRes)
    game*           = newField("game", filterable = true, fKind = fkRes)
    gameRating*     = newField("game_rating", fKind = fkRes)
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
    name*           = newField("name", true, true)
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
    dlcs*           = newField("dlcs", "dlc")
    reviews*        = newField("reviews", "review")
    score*          = newField("score")
    similarGames*   = newField("similar_games", "game")
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




import sequtils, strutils

type
    FieldType* = enum
        gbObj,
        regObj

    Field* = object
        apiName*: string
        sortable*, filterable*: bool

proc newField*(apiName: string, sortable, filterable: bool = false): Field =
    result.apiName = apiName
    result.sortable = sortable
    result.filterable = filterable

const
    aliases*        = newField("aliases", filterable = true)
    apiDetailUrl*   = newField("api_detail_url")
    birthday*       = newField("birthday", true, true)
    characters*     = newField("characters")
    channelName*    = newField("channel_name")
    concepts*       = newField("concepts")
    added*          = newField("date_added", true, true)
    lastUpdated*    = newField("date_last_updated", true, true)
    summary*        = newField("deck")
    desc*           = newField("description")
    devs*           = newField("developers")
    enemies*        = newField("enemies")
    expReleaseDay*  = newField("expected_release_day")
    expReleaseMon*  = newField("expected_release_month", filterable = true)
    expReleaseQrtr* = newField("expected_release_quarter", filterable = true)
    expReleaseYear* = newField("expected_release_year", filterable = true)
    firstChars*     = newField("first_appearance_characters")
    firstConcepts*  = newField("first_appearance_concepts")
    firstInGame*    = newField("first_appeared_in_game")
    firstLocs*      = newField("first_appearance_locations")
    firstObjects*   = newField("first_appearance_objects")
    firstPeople*    = newField("first_appearance_people")
    franchises*     = newField("franchises")
    friends*        = newField("friends")
    games*          = newField("games")
    genres*         = newField("genres")
    gender*         = newField("gender")
    id*             = newField("id")
    image*          = newField("image")
    images*         = newField("images")
    killedChars*    = newField("killed_characters")
    lastName*       = newField("last_name")
    locations*      = newField("locations")
    name*           = newField("name")
    amtUserReviews* = newField("number_of_user_reviews")
    objects*        = newField("objects")
    origGameRating* = newField("original_game_rating")
    origRlsDate*    = newField("original_release_date")
    password*       = newField("password")
    people*         = newField("people")
    platforms*      = newField("platforms")
    publishers*     = newField("publishers")
    realName*       = newField("real_name")
    releases*       = newField("releases")
    dlcs*           = newField("dlcs")
    reviews*        = newField("reviews")
    similarGames*   = newField("similarGames")
    siteDetailUrl*  = newField("site_detail_url")
    title*          = newField("title")
    themes*         = newField("themes")
    videos*         = newField("videos")
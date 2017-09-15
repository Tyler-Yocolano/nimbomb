import private.nbfield
import strutils, macros

proc snakeToCamel(snake: string): string =
    let sep = snake.split("_")
    result = ""
    for i in 0..<sep.len:
        if i == 0:
            result.add(sep[i])
        else:
            result.add(sep[i].capitalizeAscii)

macro letField(n: varargs[untyped]): untyped =
    result = newStmtList()
    for item in n:
        let fName = newIdentNode(snakeToCamel($item[0]))
        var args = newNimNode(nnkArglist)
        for arg in item:
            args.add arg
        result.add quote do:
            let `fName` = newField(`args`)

# - Field variables.
#
# Initiated here to help create and search for resources
letField(
    ("abbreviation"),
    ("aliases", true),
    ("api_detail_url"),
    ("birthday", true, true),
    ("birth_date", true, true),
    ("characters", "character"),
    ("channel_name"),
    ("concepts", "concept"),
    ("company", fKind = fkRes),
    ("companies", "company"),
    ("country", true, true),
    ("date_added", true, true),
    ("date_founded", true, true),
    ("date_last_updated", true, true),
    ("death_date", true, true),
    ("deck"),
    ("description"),
    ("detail_resource_name"),
    ("developers", "company"),
    ("developed_games"),
    ("developer_releases"),
    ("distributor_releases"),
    ("dlc_name"),
    ("enemies"),
    ("expected_release_day"),
    ("expected_release_month", filterable = true),
    ("expected_release_quarter", filterable = true),
    ("expected_release_year", filterable = true),
    ("error"),
    ("first_appeared_in_franchise"),
    ("first_appearance_characters", "character"),
    ("first_appearance_concepts", "concept"),
    ("first_appeared_in_game", fKind = fkRes),
    ("first_appearance_locations", "location"),
    ("first_appearance_objects", "object"),
    ("first_appearance_people", "person"),
    ("first_credited_game", fKind = fkRes),
    ("franchises", "franchise"),
    ("friends", fkind = fkRes),
    ("game", filterable = true, fKind = fkRes),
    ("game_rating", fKind = fkRes),
    ("games", "game"),
    ("genres", "genre"),
    ("gender", true, true, fkind = fkInt),
    ("hometown", true, true),
    ("id", true, true, fkInt),
    ("image", fKind = fkRes),
    ("images", "image"),
    ("install_base", true, true),
    ("killed_characters", "character"),
    ("last_name"),
    ("link"),
    ("list_resource_name"),
    ("location_address"),
    ("location_city"),
    ("location_country"),
    ("location_state"),
    ("locations", "location"),
    ("maximum_players", fkind = fkInt),
    ("minimum_players", fkind = fkInt),
    ("multiplayer_features"),
    ("name", true, true),
    ("number_of_user_reviews", fkind = fkInt),
    ("objects", "object"),
    ("original_game_rating", "game_rating"),
    ("original_release_date"),
    ("online_support", true, true),
    ("original_price", true, true),
    ("password"),
    ("people", "person"),
    ("phone"),
    ("platform", true, true, fkRes),
    ("platforms", "platform"),
    ("product_code_type"),
    ("product_code_value"),
    ("published_games"),
    ("published_releases"),
    ("publishers", "publisher"),
    ("publish_date"),
    ("rating_board", true, true, fkRes),
    ("real_name"),
    ("region", fKind = fkRes),
    ("related_concepts"),
    ("release_date", sortable = true),
    ("release", fkind = fkRes),
    ("releases", "release"),
    ("resolutions"),
    ("resource_type"),
    ("reviewer"),
    ("dlcs", "dlc"),
    ("reviews", "review"),
    ("score"),
    ("similar_games", "game"),
    ("site_detail_url"),
    ("sound_system"),
    ("singleplayer_features"),
    ("title"),
    ("themes", "theme"),
    ("website"),
    ("user"),
    ("videos", "video"),
    ("widescreen_support"),

    # Image only fields
    ("icon_url"),
    ("medium_url"),
    ("screen_url"),
    ("screen_large_url"),
    ("small_url"),
    ("super_url"),
    ("thumb_url"),
    ("tiny_url")
)
# Yowza..

echo region.kind 
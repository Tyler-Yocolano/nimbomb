type
    FieldKind* = enum
        ## Determines the type of content a field will hold.
        fkStr,  ## Init string field
        fkInt,  ## Init int field
        fkRes,  ## Init Resource field
        fkArr   ## Init sequence field

    Field* = ref FieldObject

    FieldObject* = object
        ## The fields that are contained within a response.
        apiName*: string             ## Usually a Camel-cased version of GB's 
                                     ## name for the field.
        sortable*, filterable*: bool ## Whether the fields can be sorted
                                     ## or filtered in a search.
        case kind*: FieldKind
            of fkStr: strContent: string
            of fkInt: intContent: int
            of fkRes: 
                resContent: Resource
            of fkArr:
                arrContent: seq[Resource]
                arrKind*: string 

    ResourceRef* = ref Resource

    Resource* = object
        ## Holds the objects converted from Json Objects
        apiName*: string        ## Usually a Camel-cased version of GB's 
                                ## name for the field.
        filters*: seq[string]   ## The types of filters that can be used
                                ## during a search.
        fieldList*: FieldList   ## The fields that will appear for the
                                ## object.

    FieldList* = seq[Field]

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
    ## Otherwise returns an empty string.
    if field.kind != fkStr:
        result = ""
    else:
        result = field.strContent

proc getInt*(field: Field): int =
    ## Gets the interger content of a field if its of type fkInt.
    ## Otherwise returns 0.
    if field.kind != fkInt:
        result = 0
    else:
        result = field.intContent

proc newResource(): Resource =
    result = Resource(apiName: "error")

proc getRes*(field: Field): Resource =
    ## Gets the resource content of a field if its of type fkRes.
    ## Otherwise returns an "error" resource.
    if field.kind != fkRes:
        result = newResource()
    else:
        result = field.resContent

proc getArr*(field: Field): seq[Resource] =
    ## Gets the sequence of Resrouces held by this field if its of type fkArr.
    ## Otherwise returns an empty list.
    if field.kind != fkArr:
        result = @[]
    else:
        result = field.arrContent
type
    FieldKind* = enum
        ## Determines the type of content a field will hold.
        fkStr,  ## Init string field
        fkInt,  ## Init int field
        fkRes,  ## Init Resource field
        fkArr   ## Init sequence field

    Field* = ref FieldObj

    FieldObj* = object
        ## The fields that are contained within a response.
        apiName*: string             ## Usually a Camel-cased version of GB's 
                                     ## name for the field.
        sortable*, filterable*: bool ## Whether the fields can be sorted
                                     ## or filtered in a search.
        case kind*: FieldKind
            of fkStr: strContent*: string
            of fkInt: intContent*: int
            of fkRes: 
                resContent*: Resource
            of fkArr:
                arrContent*: seq[Resource]
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
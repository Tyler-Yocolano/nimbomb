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






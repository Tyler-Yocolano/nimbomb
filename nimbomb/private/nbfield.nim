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
    if field.kind == fkStr:
        result = field.strContent
    else:
        result = ""

proc getInt*(field: Field): int =
    ## Gets the interger content of a field if its of type fkInt.
    if field.kind == fkInt:
        result = field.intContent
    else:
        result = 0

proc getArr*(field: Field): seq[Resource] =
    ## Gets the sequence of Resrouces held by this field if its of type fkArr.
    if field.kind == fkArr:
        result = field.arrContent
    else:
        result = @[]

proc `[]`*(field: Field, i: int): Resource =
    assert(field.kind == fkArr and field.getArr().len > 0)
    result = field.getArr()[i]

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








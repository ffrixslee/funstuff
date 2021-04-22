Builder := Object clone

Builder forward := method(
    writeln("<", call message name, ">")
    call message arguments foreach(
        arg,
        content := self doMessage(arg);
        if(content type == "Sequence", writeln(content)))
    writeln("</", call message name, ">")
)

Builder indentLevel := 0

Builder forward = method(
    writeln(makeIndent() .. "<", call message name, ">")
    indentLevel = indentLevel + 1
    call message arguments foreach(
        arg,
        content := self doMessage(arg);
        if(content type == "Sequence", writeln(makeIndent() .. content))
    )
    indentLevel = indentLevel - 1
    writeln(makeIndent() .. "</", call message name, ">")
)

Builder makeIndent := method(
    spaces := ""
    indentLevel repeat(spaces = spaces .. "  ")
    return spaces
)

"\nIndented builder syntax:" println
Builder ul(
            li("Io"),
            li("Lua"),
            li("JavaScript")
        )

curlyBrackets := method(
    call message arguments
)

"\nBracket list syntax:" println
"{1,2,3,4,5} println" println
{1,2,3,4,5} println
"{\"a\", \"b\", \"c\", \"d\", \"e\"} println" println
{"a", "b", "c", "d", "e"} println

OperatorTable addAssignOperator(":", "atPutNumber")

Map atPutNumber := method(
    self atPut(
        call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
        call evalArgAt(1)
    )
)
        
curlyBrackets := method(
    r := Map clone
    call message arguments foreach(arg,
        r doMessage(arg)
    )
    r
)

Map printAsAttributes := method(
    self foreach(k, v,
        write(" " .. k .. "=\"" .. v .. "\"")
    )
)

Builder forward = method(
    write(makeIndent() .. "<", call message name)
    indentLevel = indentLevel + 1
    isFirst := true
    call message arguments foreach(
        arg,
        if(isFirst,
            if(arg name == "curlyBrackets", 
                (self doMessage(arg)) printAsAttributes
            )

            write(">\n")
            isFirst = false
        )

        content := self doMessage(arg)
        if(content type == "Sequence", writeln(makeIndent() .. content))
    )
    indentLevel = indentLevel - 1
    writeln(makeIndent() .. "</", call message name, ">")
)

"\nBuilder syntax with attributes:" println
s := File with("builderSyntax.txt") openForReading contents
doString(s)
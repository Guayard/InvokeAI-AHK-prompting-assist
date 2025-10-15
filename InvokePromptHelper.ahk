; Increase prompt weight: Alt +
!NumpadAdd::
Send, ^c
ClipWait
text := Clipboard
RegExMatch(text, "^\((.*)\)(\++)?$", match)
if (match1) {
    plusCount := StrLen(match2) + 1
    pluses := ""
    Loop, %plusCount%
        pluses .= "+"
    Clipboard := "(" . match1 . ")" . pluses
} else {
    Clipboard := "(" . text . ")+"
}
Send, ^v
return

; Decrease prompt weight: Alt -
!NumpadSub::
Send, ^c
ClipWait
text := Clipboard
RegExMatch(text, "^\((.*)\)(\++)?$", match)
if (match1) {
    plusCount := StrLen(match2) + 1
    pluses := ""
    Loop, %plusCount%
        pluses .= "+"
    Clipboard := "(" . match1 . ")" . pluses
} else {
    Clipboard := "(" . text . ")+"
}
Send, ^v
return

; Increase prompt weight: Alt + =
!=::
Send, ^c
ClipWait
text := Clipboard
RegExMatch(text, "^\((.*)\)(\++)?$", match)
if (match1) {
    plusCount := StrLen(match2) + 1
    pluses := ""
    Loop, %plusCount%
        pluses .= "+"
    Clipboard := "(" . match1 . ")" . pluses
} else {
    Clipboard := "(" . text . ")+"
}
Send, ^v
return

; Decrease prompt weight: Alt + -
!-::
Send, ^c
ClipWait
text := Clipboard
RegExMatch(text, "^\((.*)\)(\++)?$", match)
if (match1) {
    plusCount := StrLen(match2) + 1
    pluses := ""
    Loop, %plusCount%
        pluses .= "-"
    Clipboard := "(" . match1 . ")" . pluses
} else {
    Clipboard := "(" . text . ")-"
}
Send, ^v
return

; Put in round brackets: Alt + (
!9::
Send, ^c
ClipWait
text := Clipboard
if (text != "") {
    ; If there is selected text, wrap it
    Clipboard := "(" . text . ")"
    Send, ^v
} else {
    ; If no selection, insert empty brackets and move cursor inside
    Send, ()
    Send, {Left}
}
return


; Put in quotes with comma: Alt + "
!'::
Send, ^c
ClipWait
text := Clipboard
if (text != "") {
    ; Wrap selection
    Clipboard := """" . text . ""","
    Send, ^v
} else {
    ; Insert empty quotes + comma and move cursor inside
    Send, """", 
    Send, {Left 3} ; move inside the quotes
}
return

; AND construction: Alt + A
!a::
Send, ^c
ClipWait
text := Clipboard
if (text != "") {
    ; Wrap selection
    Clipboard := "(""" . text . """, ""prompt2"").and()"
    Send, ^v
} else {
    ; Insert empty () and move cursor inside
    Send, ().and()
    Send, {Left 5} ; Move cursor inside first ()
}
return

; Dynamic prompts: Alt + D
!d::
Send, ^c
ClipWait
text := Clipboard
if (text != "") {
    ; Wrap selection
    Clipboard := "{ " . text . " | var2 | var3 | var4 }"
    Send, ^v
} else {
    ; Insert template and place cursor inside first slot
    Send, { var1 | var2 | var3 | var4 }
    ; Send, {Left 25} ; Move cursor after "var1"
}
return

; Random dynamic prompts: Ctrl + Alt + d 
^!d::
Send, ^c
ClipWait
text := Clipboard
if (text != "") {
    ; Wrap selection
    Clipboard := "{ 2$$ " . text . " | var2 | var3 | var4 }"
    Send, ^v
} else {
    ; Insert template and place cursor inside first slot
    Send, { var1 | var2 | var3 | var4 }
    ; Send, {Left 25} ; Move cursor after "var1"
}
return

; Blending prompts: Alt + B
!b::
Send, ^c
ClipWait
text := Clipboard
if (text != "") {
    ; Wrap selection
    Clipboard := "(""" . text . """, ""prompt2"").blend(1,1)"
    Send, ^v
} else {
    ; Insert empty () and move cursor inside
    Send, ().and()
    Send, {Left 7} ; Move cursor inside first ()
}
return

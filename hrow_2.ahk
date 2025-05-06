#Requires AutoHotkey v2.0
SendMode("Input") ; Recommended for new scripts due to its superior speed and reliability
SetCapsLockState("AlwaysOff")

; Esc if tapped, otherwise do nothing (acts as layer key)
CapsLock::
{
    Send("")  ; simulate press to avoid sticking
    KeyWait("CapsLock")
    if (A_PriorKey = "CapsLock")
        Send("{Esc}")
}

; Google Search highlighted text
CapsLock & g::
{
    A_Clipboard := ""          ; clear any old data
    Send("^c")                 ; copy selection
    ClipWait(1)                ; wait up to 1s
    if A_Clipboard
    {
        query := StrReplace(A_Clipboard, " ", "+")
        Run("https://www.google.com/search?q=" . query)
    }
}

CapsLock & SC022::  ; same as CapsLock+g but by scancode
{
    A_Clipboard := ""
    Send("^c")
    ClipWait(1)
    if A_Clipboard
    {
        query := StrReplace(A_Clipboard, " ", "+")
        Run("https://www.google.com/search?q=" . query)
    }
}
; Movement remaps
CapsLock & h::Send("{Blind}{Left DownTemp}")
CapsLock & h Up::Send("{Blind}{Left Up}")

CapsLock & SC023::Send("{Blind}{Left DownTemp}")
CapsLock & SC023 Up::Send("{Blind}{Left Up}")

CapsLock & a::Send("{Blind}{Left DownTemp}")
CapsLock & a Up::Send("{Blind}{Left Up}")

CapsLock & SC01E::Send("{Blind}{Left DownTemp}")
CapsLock & SC01E Up::Send("{Blind}{Left Up}")

CapsLock & j::Send("{Blind}{Down DownTemp}")
CapsLock & j Up::Send("{Blind}{Down Up}")

CapsLock & SC024::Send("{Blind}{Down DownTemp}")
CapsLock & SC024 Up::Send("{Blind}{Down Up}")

CapsLock & s::Send("{Blind}{Down DownTemp}")
CapsLock & s Up::Send("{Blind}{Down Up}")

CapsLock & SC01F::Send("{Blind}{Down DownTemp}")
CapsLock & SC01F Up::Send("{Blind}{Down Up}")

CapsLock & k::Send("{Blind}{Up DownTemp}")
CapsLock & k Up::Send("{Blind}{Up Up}")

CapsLock & SC025::Send("{Blind}{Up DownTemp}")
CapsLock & SC025 Up::Send("{Blind}{Up Up}")

CapsLock & w::Send("{Blind}{Up DownTemp}")
CapsLock & w Up::Send("{Blind}{Up Up}")

CapsLock & SC011::Send("{Blind}{Up DownTemp}")
CapsLock & SC011 Up::Send("{Blind}{Up Up}")

CapsLock & l::Send("{Blind}{Right DownTemp}")
CapsLock & l Up::Send("{Blind}{Right Up}")

CapsLock & SC026::Send("{Blind}{Right DownTemp}")
CapsLock & SC026 Up::Send("{Blind}{Right Up}")

CapsLock & d::Send("{Blind}{Right DownTemp}")
CapsLock & d Up::Send("{Blind}{Right Up}")

CapsLock & SC020::Send("{Blind}{Right DownTemp}")
CapsLock & SC020 Up::Send("{Blind}{Right Up}")

; CapsLock + Backspace -> Delete
CapsLock & Backspace::Send("{Delete}")

; CapsLock + Space -> Enter
CapsLock & Space::Send("{Enter Down}")

; CapsLock + RButton -> Alt+F4
CapsLock & RButton::Send("!{F4}")

; CapsLock + RShift -> Apps key
CapsLock & RShift::Send("{AppsKey}")

; Close tab
CapsLock & q::Send("^F4")
CapsLock & SC010::Send("^F4")

; Close window
CapsLock & e::Send("!F4")
CapsLock & SC012::Send("!F4")

; Simulate click (Shift + F10)
CapsLock & c::Send("+{F10}")
CapsLock & SC02E::Send("+{F10}")

; Function keys on number row
CapsLock & 1::Send("{F1}")
CapsLock & 2::Send("{F2}")
CapsLock & 3::Send("{F3}")
CapsLock & 4::Send("{F4}")
CapsLock & 5::Send("{F5}")
CapsLock & 6::Send("{F6}")
CapsLock & 7::Send("{F7}")
CapsLock & 8::Send("{F8}")
CapsLock & 9::Send("{F9}")
CapsLock & 0::Send("{F10}")
CapsLock & -::Send("{F11}")
CapsLock & =::Send("{F12}")

; Ins + CapsLock -> toggle CapsLock state
Ins & CapsLock::
{
    if GetKeyState("CapsLock", "T")
        SetCapsLockState("AlwaysOff")
    else
        SetCapsLockState("AlwaysOn")
}

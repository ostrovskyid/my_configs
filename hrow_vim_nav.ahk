#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#Persistent
#SingleInstance, Force
SetCapsLockState, AlwaysOff

;Esc if pressed and layer key if hold
Capslock::
Send {}
KeyWait, CapsLock
Send {}
if ( A_PriorKey = "CapsLock" )
{
    Send {Esc}
}
return


; Google Search highlighted text
Capslock & g:: 
{
 Send, ^c
 Sleep 50
 Run, http://www.google.com/search?q=%clipboard%
 Return
}

Capslock & SC022:: 
{
 Send, ^c
 Sleep 50
 Run, http://www.google.com/search?q=%clipboard%
 Return
}

; CapsLock + hjkl: left, down, up, right
; Capslock + wasd: up, left, down, right
;left
Capslock & h::Send {Blind}{Left DownTemp}
Capslock & h up::Send {Blind}{Left Up}

Capslock & SC023::Send {Blind}{Left DownTemp}
Capslock & SC023 up::Send {Blind}{Left Up}

Capslock & a::Send {Blind}{Left DownTemp}
Capslock & a up::Send {Blind}{Left Up}

Capslock & SC01E::Send {Blind}{Left DownTemp}
Capslock & SC01E up::Send {Blind}{Left Up}

;down
Capslock & j::Send {Blind}{Down DownTemp}
Capslock & j up::Send {Blind}{Down Up}

Capslock & SC024::Send {Blind}{Down DownTemp}
Capslock & SC024 up::Send {Blind}{Down Up}

Capslock & s::Send {Blind}{Down DownTemp}
Capslock & s up::Send {Blind}{Down Up}

Capslock & SC01F::Send {Blind}{Down DownTemp}
Capslock & SC01F up::Send {Blind}{Down Up}

;up
Capslock & k::send {Blind}{Up DownTemp}
Capslock & k up::send {Blind}{Up Up}

Capslock & sc025::send {Blind}{Up DownTemp}
Capslock & sc025 up::send {Blind}{Up Up}

Capslock & w::send {Blind}{Up DownTemp}
Capslock & w up::send {Blind}{Up Up}

Capslock & sc011::send {Blind}{Up DownTemp}
Capslock & sc011 up::send {Blind}{Up Up}

;right
Capslock & l::Send {Blind}{Right DownTemp}
Capslock & l up::Send {Blind}{Right Up}

Capslock & SC026::Send {Blind}{Right DownTemp}
Capslock & SC026 up::Send {Blind}{Right Up}

Capslock & d::Send {Blind}{Right DownTemp}
Capslock & d up::Send {Blind}{Right Up}

Capslock & SC020::Send {Blind}{Right DownTemp}
Capslock & SC020 up::Send {Blind}{Right Up}

; CapsLock + Backspace -> Delete
Capslock & BackSpace:: Delete 

; MakCapslock+Space -> Enter
Capslock & Space::SendInput {Enter Down}

; CapsLodk + Right button -> Alt+F4
Capslock & RButton:: !F4

; CapsLock + RShift -> App key
Capslock & RShift::SendInput {AppsKey}

; Close tab
CapsLock & q::^F4
CapsLock & SC010::^F4

; Close window 
CapsLock & e::!F4
CapsLock & SC012::!F4

; Simulat a click\
CapsLock & c::+F10
CapsLock & SC02E::+F10

; Numpad using Ctrl+Win+Alt + m,.jkluio and space
#^!Space:: SendInput {Numpad0}
#^!m:: SendInput {Numpad1}
#^!SC032:: SendInput {Numpad1}
#^!,:: SendInput {Numpad2}
#^!SC033:: SendInput {Numpad2}
#^!.:: SendInput {Numpad3}
#^!SC034:: SendInput {Numpad3}
#^!j:: SendInput {Numpad4}
#^!SC024:: SendInput {Numpad4}
#^!k:: SendInput {Numpad5}
#^!sc025:: SendInput {Numpad5}
#^!l:: SendInput {Numpad6}
#^!SC026:: SendInput {Numpad6}
#^!u:: SendInput {Numpad7}
#^!SC016:: SendInput {Numpad7}
#^!i:: SendInput {Numpad8}
#^!SC017:: SendInput {Numpad8}
#^!o:: SendInput {Numpad9}
#^!SC018:: SendInput {Numpad9}

; F1-12 on digits row
Capslock & 1:: F1
Capslock & 2:: F2
Capslock & 3:: F3
Capslock & 4:: F4
Capslock & 5:: F5
Capslock & 6:: F6
Capslock & 7:: F7
Capslock & 8:: F8
Capslock & 9:: F9
Capslock & 0:: F10
Capslock & -:: F11
Capslock & =:: F12

;Ins + Capslock work like Capslock 
Ins & Capslock::
If GetKeyState("CapsLock", "T") = 1
    SetCapsLockState, AlwaysOff
Else 
    SetCapsLockState, AlwaysOn
Return


;Hotstrings
::gm::ostrovskyi.d@gmail.com


; Drag windows anywhere
;
; This script modified from the original: http://www.autohotkey.com/docs/scripts/EasyWindowDrag.htm
; by The How-To Geek
; http://www.howtogeek.com 

Capslock & LButton::
CoordMode, Mouse  ; Switch to screen/absolute coordinates.
MouseGetPos, EWD_MouseStartX, EWD_MouseStartY, EWD_MouseWin
WinGetPos, EWD_OriginalPosX, EWD_OriginalPosY,,, ahk_id %EWD_MouseWin%
WinGet, EWD_WinState, MinMax, ahk_id %EWD_MouseWin% 
if EWD_WinState = 0  ; Only if the window isn't maximized 
    SetTimer, EWD_WatchMouse, 10 ; Track the mouse as the user drags it.
return

EWD_WatchMouse:
GetKeyState, EWD_LButtonState, LButton, P
if EWD_LButtonState = U  ; Button has been released, so drag is complete.
{
    SetTimer, EWD_WatchMouse, off
    return
}
GetKeyState, EWD_EscapeState, Escape, P
if EWD_EscapeState = D  ; Escape has been pressed, so drag is cancelled.
{
    SetTimer, EWD_WatchMouse, off
    WinMove, ahk_id %EWD_MouseWin%,, %EWD_OriginalPosX%, %EWD_OriginalPosY%
    return
}
; Otherwise, reposition the window to match the change in mouse coordinates
; caused by the user having dragged the mouse:
CoordMode, Mouse
MouseGetPos, EWD_MouseX, EWD_MouseY
WinGetPos, EWD_WinX, EWD_WinY,,, ahk_id %EWD_MouseWin%
SetWinDelay, -1   ; Makes the below move faster/smoother.
WinMove, ahk_id %EWD_MouseWin%,, EWD_WinX + EWD_MouseX - EWD_MouseStartX, EWD_WinY + EWD_MouseY - EWD_MouseStartY
EWD_MouseStartX := EWD_MouseX  ; Update for the next timer-call to this subroutine.
EWD_MouseStartY := EWD_MouseY

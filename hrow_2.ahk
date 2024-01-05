
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
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

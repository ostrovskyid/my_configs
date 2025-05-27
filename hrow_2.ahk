#Requires AutoHotkey v2.
SendMode("Input")
SetCapsLockState("AlwaysOff")

; --- CAPSLOCK TAP = ESC, HOLD = LAYER KEY ---
CapsLock::{
    start := A_TickCount
    KeyWait("CapsLock") ; Wait for release
    held := A_TickCount - start
    if (held < 200) && (A_PriorKey = "CapsLock")
        Send("{Esc}")
}

; --- GOOGLE SEARCH SELECTED TEXT (CapsLock+g, CapsLock+SC022) ---
googleSearch() {
    A_Clipboard := ""
    Send("^c")
    if ClipWait(1) && (query := Trim(A_Clipboard)) {
        query := StrReplace(query, " ", "+")
        Run("https://www.google.com/search?q=" . query)
    }
}
CapsLock & g::googleSearch()
CapsLock & SC022::googleSearch()

; --- MOVEMENT REMAPS (CapsLock+h/j/k/l/a/s/w/d etc, plus scancodes) ---
; Map all variants to the same movement action to avoid code duplication
moveKeys := Map(
    "h",      "Left",  "a",     "Left",   "SC023", "Left",   "SC01E", "Left",
    "j",      "Down",  "s",     "Down",   "SC024", "Down",   "SC01F", "Down",
    "k",      "Up",    "w",     "Up",     "SC025", "Up",     "SC011", "Up",
    "l",      "Right", "d",     "Right",  "SC026", "Right",  "SC020", "Right"
)

makeNavFn(dir, isDown) {
    return (*) => Send("{Blind}{" dir (isDown ? " DownTemp" : " Up") "}")
}

for key, dir in moveKeys {
    Hotkey("CapsLock & " key,      makeNavFn(dir, true))
    Hotkey("CapsLock & " key " Up",makeNavFn(dir, false))
}



; --- SPECIAL FUNCTION SHORTCUTS ---
CapsLock & Backspace::Send("{Delete}")        ; CapsLock+Backspace → Delete
CapsLock & Space::Send("{Enter Down}")        ; CapsLock+Space → Enter
CapsLock & RButton::Send("!{F4}")             ; CapsLock+RButton → Alt+F4 (close window)
CapsLock & RShift::Send("{AppsKey}")          ; CapsLock+RShift → Context/Apps key

; --- CLOSE TAB & CLOSE WINDOW (with scan codes) ---
CapsLock & q::Send("^F4")         ; Close tab
CapsLock & SC010::Send("^F4")
CapsLock & e::Send("!F4")         ; Close window
CapsLock & SC012::Send("!F4")

; --- CONTEXT MENU (SHIFT+F10, with scan code) ---
CapsLock & c::Send("+{F10}")
CapsLock & SC02E::Send("+{F10}")

; --- FUNCTION KEYS ON NUMBER ROW ---
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

; --- TOGGLE CAPSLOCK (Ins+CapsLock) ---
Ins & CapsLock::{
    if GetKeyState("CapsLock", "T")
        SetCapsLockState("AlwaysOff")
    else
        SetCapsLockState("AlwaysOn")
}

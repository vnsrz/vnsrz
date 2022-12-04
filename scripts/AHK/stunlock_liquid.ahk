#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

v::
Loop {
    Send, c
    Sleep, 375
}

Pause::Pause ; pause

+Esc::ExitApp ; close 
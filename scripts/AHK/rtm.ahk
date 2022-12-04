#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

z::LButton

x::
MouseMove, 1480, 600, 0
Send {LButton down}
MouseMove, 1480, 300, 40
Sleep, 100
Send {LButton up}
Sleep, 100
MouseMove, 1480, 600, 40

!j::Reload ; reload
; Script for using the Numpad key as morse code input.
; By Vinicius R.

; How to use: 
; Ctrl+J            starts the script
; PauseBreak        pauses the script
; Alt+J             reloads the script
; Shift+Esc         closes AutoHotKey

; Press Numpad for a dot, and hold it for a dash.
; If you hold it for too long, no symbol will be typed.
; The pauses are added according to the time between a key press and the last.
; Timetable for key presses and pauses is found below.

; -----------------------------------------------------------------------------------------------

; Morse code timing rules:
; The length of a dot is 1 time unit. (consider 300ms as 1 time unit for instance)
; A dash is 3 time units. (900ms)
; The space between symbols (dots and dashes) of the same letter is 1 time unit. (300ms)
; The space between letters is 3 time units. (900ms)
; The space between words is 7 time units. (2100ms)

; Values tweaked for ease of use: 
; Dot                               300ms (or less)
; Dash                              900ms
; Pause between letters             900ms
; Pause between words               1800ms
; Reset time                        5000ms

; -----------------------------------------------------------------------------------------------

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


^j:: ; start

dot := 300
dash := 900
letterPause := 900
wordPause := 1800
resetTime := 5000

Loop {
    KeyWait, NumLock, D                                             
    pauseLenght := A_TickCount - lastCharTime                       ; calculates the time between this key press and the last one
    holdTime := A_TickCount
    KeyWait, NumLock, L 
    releaseTime := A_TickCount - holdTime                           ; calculates the hold time

    ; Determines if a space or a / should be used
    if (pauseLenght >= letterPause && pauseLenght < wordPause) 
        Send, {Space}
    else if (pauseLenght > wordPause && pauseLenght < resetTime)
        Send, {Space}/{Space}

    ; Determines if a . or a - should be used
    if (releaseTime <= dot) 
        Send, .
    else if (releaseTime > dot && releaseTime <= dash)
        Send, -
          
    lastCharTime := A_TickCount
}                                                                                                                     
return


Pause::Pause ; pause


+Esc::ExitApp ; close 


!j::Reload ; reload

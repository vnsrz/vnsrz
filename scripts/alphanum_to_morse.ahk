; Script for translating the keyboad input into morse code.
; By Vinicius R.

; How to use: 
; Ctrl+J            starts the script
; Ctrl              stops the script
; Alt+J             reloads the script
; Shift+Esc         closes AutoHotKey

; -----------------------------------------------------------------------------------------------

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


^j::

extraCharacters := [",",".","?",";",":","/","-","'","_","(",")","=","+","@","!"]

Loop {
    Input, UserInput, L1, {Enter}{LControl}{RControl}{BackSpace}

    switch ErrorLevel {
        case "Timeout":
            MsgBox, You entered "%UserInput%" at which time the input timed out.
            return
        case "NewInput":
            return
        default:
            if InStr(ErrorLevel, "EndKey:BackSpace") {
                bckspc = 1
            }
            else if InStr(ErrorLevel, "EndKey:Enter") {
                Send, {Enter}
            }
            else if InStr(ErrorLevel, "EndKey:LControl") Or InStr(ErrorLevel, "EndKey:RControl") {
                MsgBox, The input will be now terminated. Press Ctrl+J to activate it again.
                return
            }
    }

    switch UserInput { 
        case " ": 
            Send, /{Space}
            size = 2
        case "a": 
            Send, .-
            size = 3
        case "b": 
            Send, -...
            size = 5
        case "c": 
            Send, -.-.
            size = 5
        case "d": 
            Send, -..
            size = 4
        case "e": 
            Send, .
            size = 2
        case "f": 
            Send, ..-.
            size = 5
        case "g": 
            Send, --.
            size = 4
        case "h": 
            Send, ....
            size = 5
        case "i": 
            Send, ..
            size = 3
        case "j": 
            Send, .---
            size = 5
        case "k": 
            Send, -.-
            size = 4
        case "l": 
            Send, .-..
            size = 5
        case "m": 
            Send, --
            size = 3
        case "n": 
            Send, -.
            size = 3
        case "o": 
            Send, ---
            size = 4
        case "p": 
            Send, .--.
            size = 5
        case "q": 
            Send, --.-
            size = 5
        case "r": 
            Send, .-.
            size = 4
        case "s": 
            Send, ...
            size = 4
        case "t": 
            Send, -
            size = 2
        case "u": 
            Send, ..-
            size = 4
        case "v": 
            Send, ...-
            size = 5
        case "w": 
            Send, .--
            size = 4
        case "x": 
            Send, -..-
            size = 5
        case "y": 
            Send, -.--
            size = 5
        case "z": 
            Send, --..
            size = 5
        case "1": 
            Send, .----
            size = 6
        case "2": 
            Send, ..---
            size = 6
        case "3": 
            Send, ...--
            size = 6
        case "4": 
            Send, ....-
            size = 6
        case "5": 
            Send, .....
            size = 6
        case "6": 
            Send, -....
            size = 6
        case "7": 
            Send, --...
            size = 6
        case "8": 
            Send, ---..
            size = 6
        case "9": 
            Send, ----.
            size = 6
        case "0": 
            Send, -----
            size = 6
        case ",": 
            Send, --..--
            size = 7
        case ".": 
            Send, .-.-.-
            size = 7
        case "?": 
            Send, ..--..
            size = 7
        case ";": 
            Send, -.-.-.
            size = 7
        case ":": 
            Send, ---...
            size = 7
        case "-": 
            Send, -....-
            size = 7
        case "/": 
            Send, --..--
            size = 7
        case "'": 
            Send, .----.
            size = 7
        case "_": 
            Send, ..--.-
            size = 7
        case "(": 
            Send, -.--.
            size = 6
        case ")": 
            Send, -.--.-
            size = 7
        case "=": 
            Send, -...-
            size = 6
        case "+": 
            Send, .-.-.
            size = 6
        case "@": 
            Send, .--.-.
            size = 7
        case "!": 
            Send, -.-.--
            size = 7
    }

    if (bckspc = 1) {
        bckspc = 0
        Send, {BackSpace %size%}
        size = 1
    }
    else if (UserInput is alnum) Or HasVal(extraCharacters, UserInput)
        Send, {Space}
    
}   Return

HasVal(haystack, needle) {
	if !(IsObject(haystack)) || (haystack.Length() = 0)
		return 0
	for index, value in haystack
		if (value = needle)
			return index
	return 0
}

Pause::Pause ; pause


+Esc::ExitApp ; close 


!j::Reload ; reload


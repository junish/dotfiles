tell application "Safari"
 do JavaScript "location.reload()" in document 1
end tell

tell application "Firefox" to activate
tell application "System Events" to keystroke "r" using {command down}

tell application "Opera" to activate
tell application "System Events" to keystroke "r" using {command down}

tell application "Vim" to activate

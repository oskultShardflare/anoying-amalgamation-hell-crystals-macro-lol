#NoEnv
#SingleInstance Force
#MaxThreadsPerHotkey 1
SendMode Event
SetWorkingDir %A_ScriptDir%

macroEnabled := false
macroRunning := false

Gui, Font, s10
Gui, Add, Text, vStatusText w200 Center, Status: OFF
Gui, Add, Button, w100 gToggleMacro, Toggle
Gui, Show,, Crystal Escape Macro

return

ToggleMacro:
macroEnabled := !macroEnabled

if (macroEnabled)
    GuiControl,, StatusText, Status: ON
else
    GuiControl,, StatusText, Status: OFF
return

F8::
Gosub, ToggleMacro
return

c::
if (!macroEnabled)
    return

if (macroRunning)
    return

macroRunning := true

endTime := A_TickCount + 2000

while (A_TickCount < endTime)
{
    SendEvent, w
    SendEvent, a
    SendEvent, s
    SendEvent, d
    Sleep, 10
}

SendInput, {w up}{a up}{s up}{d up}

macroRunning := false
return

GuiClose:
ExitApp
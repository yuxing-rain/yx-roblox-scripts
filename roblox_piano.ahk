#SingleInstance, force
StringCaseSense, On

Is_Upper(str) {
  return (str >= "A") and (str <= "Z")
}

Gui, +AlwaysOnTop +Resize +Border +ToolWindow
Gui, Font, s9 Bold, Century Gothic
GuiControl, Font, MyEdit

SysGet, MonitorWorkArea, MonitorWorkArea
ScreenWidth := MonitorWorkAreaRight - MonitorWorkAreaLeft

GuiWidth := 150
GuiX := ScreenWidth - GuiWidth - 120

Gui, Add, Text,, BPM (beats per minute)
Gui, Add, Edit, w%GuiWidth% vBPM, 100
Gui, Add, Text,, Transposition
Gui, Add, Edit, w%GuiWidth% vTranspos, 0
Gui, Add, Checkbox, vno_ignore_n, Don't ignore \n
Gui, Add, Text,, music sheet (keys to press)
Gui, Add, Edit, r5 w%GuiWidth% vPianoMusic
Gui, Add, Button, gSaveSheet, Save Sheet
Gui, Add, Button, gLoadSheet, Load Sheet
Gui, Add, Text,, Numpad1: play
Gui, Add, Text,, Numpad2: pause/resume
Gui, Add, Text,, Numpad3: reopen script
Gui, Add, Text,, skidded (edited) by yx
Gui, Add, Text, xm y+10 w%GuiWidth% vKeysToPress, Current Key: 
Gui, Show, x%GuiX%

Numpad1::
Gui, Submit, Nohide
If (no_ignore_n)
{
    PianoMusic := RegExReplace(PianoMusic, "[\n\r/]", " ")
}
Else
{
    PianoMusic := RegExReplace(PianoMusic, "[\n\r/]", "")
}

N := 1
KeyDelay := (60000 / BPM)

while (N := RegExMatch(PianoMusic, "U)(\[.*]|.)", Keys, N))
{
    N += StrLen(Keys)
    Keys := Trim(Keys, "[]")
    StringUpper, DisplayText, Keys
    if (Keys = " ")
    {
        Sleep, KeyDelay * 0.3
    }
    else if (Keys = "|")
    {
        Sleep, KeyDelay * 0.95
    }
    else if (Keys = "-")
    {
        Sleep, KeyDelay * 0.5
    }
    else if (Is_Upper(Keys))
    {
        GuiControl,, KeysToPress, Current Key: shift + %DisplayText%
        Loop, Parse, Keys
        {
            SendInput +{%A_LoopField% down}
        }
        Sleep, KeyDelay * 0.3
        Loop, Parse, Keys
        {
            SendInput +{%A_LoopField% up}
        }
    }
    else
    {
        GuiControl,, KeysToPress, Current Key: %DisplayText%
        Loop, Parse, Keys
        {
            SendInput {%A_LoopField% down}
        }
        Sleep, KeyDelay * 0.3
        Loop, Parse, Keys
        {
            SendInput {%A_LoopField% up}
        }
    }
}
return

Numpad3::
newScript := A_ScriptDir . "\roblox_piano.ahk"
Run, %newScript%
return

Numpad2::
Pause
Suspend
return

GuiClose:
ExitApp

SaveSheet:
    InputBox, SheetName, Save Music Sheet, Enter the name of the sheet:
    if ((SheetName != ""))
    {
        GuiControlGet, BPM, , BPM
        GuiControlGet, Transpos, , Transpos
        GuiControlGet, PianoMusic, , PianoMusic
        IfNotExist, %A_ScriptDir%\MusicSheets
            FileCreateDir, %A_ScriptDir%\MusicSheets
        FileDelete, %A_ScriptDir%\MusicSheets\%SheetName%.txt
        FileAppend, <%Transpos%>{%BPM%}%PianoMusic%, %A_ScriptDir%\MusicSheets\%SheetName%.txt
    }
return

LoadSheet:
    FileSelectFile, file
    if ((file != ""))
    {
        FileRead, str, %file%

        RegExMatch(str, "<([^<>]*)>", TransposMatch)
        Transpos := TransposMatch1
        str := StrReplace(str, TransposMatch, "")
        RegExMatch(str, "{([^{}]*)}", BpmMatch)
        Bpm := BpmMatch1
        str := StrReplace(str, BpmMatch, "")
        GuiControl,, Transpos, %Transpos%
        GuiControl,, BPM, %Bpm%
        GuiControl,, PianoMusic, %str%
    }
return
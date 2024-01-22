#SingleInstance, force
#MaxHotkeysPerInterval 9999
#MaxThreadsPerHotkey 1
StringCaseSense, On
SetKeyDelay, -1, -1
SendMode Input

Is_Upper(str) {
  Return (str >= "A") and (str <= "Z")
}

Gui, +AlwaysOnTop +Resize +Border +ToolWindow
Gui, Font, s9 Bold, Century Gothic
GuiControl, Font, MyEdit

SysGet, MonitorWorkArea, MonitorWorkArea
ScreenWidth := MonitorWorkAreaRight - MonitorWorkAreaLeft

GuiWidth := 150
GuiX := ScreenWidth - GuiWidth - 120

TabWidth := GuiWidth + 30
Gui, Add, Tab3, gTabChanged w%TabWidth% r1, General|Config|Display

Gui, Tab, 1
Gui, Add, Text,, BPM (beats per minute)
Gui, Add, Edit, w%GuiWidth% vBPM, 120
Gui, Add, Text,, Transpose
Gui, Add, Edit, w%GuiWidth% vTranspose, 0
Gui, Add, Text,, music sheet (keys to press)
Gui, Add, Edit, r2 w%GuiWidth% vPianoMusic
Gui, Add, Button, gSaveSheet, Save Sheet
Gui, Add, Button, gLoadSheet, Load Sheet

Gui, Tab, 2
Gui, Add, Text,, Max Transpose
Gui, Add, Edit, w%GuiWidth% vMaxTranspose, 0
Gui, Add, Checkbox, vno_ignore_n, Don't ignore \n
Gui, Add, Text,, Speed of " "
Gui, Add, Edit, w%GuiWidth% vShortPauseSpeed, 0.25
Gui, Add, Text,, Speed of note
Gui, Add, Edit, w%GuiWidth% vNoteSpeed, 0.25
Gui, Add, Text,, Speed of "|"
Gui, Add, Edit, w%GuiWidth% vLongPauseSpeed, 1


Gui, Tab, 3
Gui, Add, Text, w%GuiWidth% vKeysToPress, Current Key: 
Gui, Add, Text, w%GuiWidth% vProgress, Progress
Gui, Add, Text, w%GuiWidth% vPaused
Gui, Add, Button, gPlay, Numpad1: play
Gui, Add, Button, gTogglePause, Numpad2: pause/resume
Gui, Add, Button, gStop, Numpad3: stop
Gui, Add, Button, gReopen, Numpad0: reopen script
Gui, Add, Text,, skidded (edited) by yx


Gui, Show, x%GuiX%

IsPlaying := False
Paused := False

Numpad1::
Goto, Play
Return

Numpad2::
Goto, TogglePause
Return

Numpad3::
Goto, Stop
Return

Numpad0::
Goto, Reopen
Return

Play:
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

Loop, %MaxTranspose%
{
    Send, {Up}
    Send, {Up}
}
Loop, %MaxTranspose%
{
    Send, {Down}
}
if (Transpose < 0)
{
    Transpose := Abs(Transpose)
    Loop, %Transpose%
    {
        Send, {Down}
    }
}
else if (Transpose > 0)
{
    Loop, %Transpose%
    {
        Send, {Up}
    }
}

IsPlaying := True
while (N := RegExMatch(PianoMusic, "U)(\[.*]|.)", Keys, N))
{
    If (Paused == True)
    {
        While, (Paused == True)
        {
            Sleep, 10
        }
    }
    If (IsPlaying == False)
    {
        Break
    }
    N += StrLen(Keys)
    Keys := Trim(Keys, "[]")
    StringUpper, DisplayText, Keys
    if (Keys = " ")
    {
        Sleep, KeyDelay * ShortPauseSpeed
    }
    else if (Keys = "|")
    {
        Sleep, KeyDelay * LongPauseSpeed
    }
    else if (Is_Upper(Keys))
    {
        GuiControl,, KeysToPress, Current Key: shift + %DisplayText%
        Loop, Parse, Keys
        {
            SendInput +{%A_LoopField% down}
        }
        Sleep, KeyDelay * NoteSpeed
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
        Sleep, KeyDelay * NoteSpeed
        Loop, Parse, Keys
        {
            SendInput {%A_LoopField% up}
            
        }
    }
    TotalKeys := StrLen(PianoMusic)
    PlayedKeys := N-1
    ProgressPercentage := Round((PlayedKeys / TotalKeys) * 100)
    GuiControl,, Progress, %PlayedKeys% / %TotalKeys% (%ProgressPercentage%)
}
Return

Reopen:
Reload
Return

TogglePause:
Paused := not Paused
If (Paused == True)
{
    GuiControl,, Paused, Paused
}
Else
{
    GuiControl,, Paused, 
}
Return

Stop:
IsPlaying := False
Paused := False
GuiControl,, Paused, 
Return

SaveSheet:
    InputBox, SheetName, Save Music Sheet, Enter the name of the sheet:
    if ((SheetName != ""))
    {
        GuiControlGet, BPM, , BPM
        GuiControlGet, Transpose, , Transpose
        GuiControlGet, PianoMusic, , PianoMusic
        IfNotExist, %A_ScriptDir%\MusicSheets
            FileCreateDir, %A_ScriptDir%\MusicSheets
        FileDelete, %A_ScriptDir%\MusicSheets\%SheetName%.txt
        FileAppend, <%Transpose%>{%BPM%}%PianoMusic%, %A_ScriptDir%\MusicSheets\%SheetName%.txt
    }
Return

LoadSheet:
    FileSelectFile, file
    if ((file != ""))
    {
        FileRead, str, %file%

        RegExMatch(str, "<([^<>]*)>", TransposeMatch)
        Transpose := TransposeMatch1
        str := StrReplace(str, TransposeMatch, "")
        RegExMatch(str, "{([^{}]*)}", BpmMatch)
        Bpm := BpmMatch1
        str := StrReplace(str, BpmMatch, "")
        GuiControl,, Transpose, %Transpose%
        GuiControl,, BPM, %Bpm%
        GuiControl,, PianoMusic, %str%
    }
Return

TabChanged:
    Gui, Show, AutoSize
Return
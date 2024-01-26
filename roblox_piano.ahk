#SingleInstance, force
#MaxHotkeysPerInterval 9999
#MaxThreadsPerHotkey 1
StringCaseSense, On
SetKeyDelay, -1, -1
SendMode Input

is_Upper(str) {
  Return (str >= "A") and (str <= "Z")
}

SaveConfigs()
{
    GuiControlGet, MaxTranspose, , MaxTranspose
    GuiControlGet, ShortPauseSpeed, , ShortPauseSpeed
    GuiControlGet, LongPauseSpeed, , LongPauseSpeed
    GuiControlGet, NoteSpeed, , NoteSpeed
    
    IniWrite, %MaxTranspose%, roblox_piano.ini, Configs, MaxTranspose
    IniWrite, %ShortPauseSpeed%, roblox_piano.ini, Configs, ShortPauseSpeed
    IniWrite, %LongPauseSpeed%, roblox_piano.ini, Configs, LongPauseSpeed
    IniWrite, %NoteSpeed%, roblox_piano.ini, Configs, NoteSpeed
}

LoadConfigs()
{
    filePath := newScript := A_ScriptDir . "\roblox_piano.ini"

if FileExist(filePath)
    IniRead, MaxTranspose, roblox_piano.ini, Configs, MaxTranspose
    IniRead, ShortPauseSpeed, roblox_piano.ini, Configs, ShortPauseSpeed
    IniRead, LongPauseSpeed, roblox_piano.ini, Configs, LongPauseSpeed
    IniRead, NoteSpeed, roblox_piano.ini, Configs, NoteSpeed

    GuiControl,, MaxTranspose, %MaxTranspose%
    GuiControl,, ShortPauseSpeed, %ShortPauseSpeed%
    GuiControl,, LongPauseSpeed, %LongPauseSpeed%
    GuiControl,, NoteSpeed, %NoteSpeed%
}

OnExit("SaveConfigs")

Gui, +AlwaysOnTop +Resize +Border +ToolWindow
Gui, Font, s9 Bold, Century Gothic
GuiControl, Font, MyEdit

SysGet, MonitorWorkArea, MonitorWorkArea
ScreenWidth := MonitorWorkAreaRight - MonitorWorkAreaLeft

GuiWidth := 150
GuiX := ScreenWidth - GuiWidth - 120

TabWidth := GuiWidth + 30
Gui, Add, Tab3, vTab gTabChanged w%TabWidth% r1, Sheet|Config|Display|Help

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
Gui, Add, Edit, w%GuiWidth% vLongPauseSpeed, 0.75
; "tt" is 1/4 note, "t t" is 1/2 note, "t|t" is 1 note

Gui, Tab, 3
Gui, Add, Text, w%GuiWidth% vProgress, Progress
Gui, Add, Text, w%GuiWidth% vPaused
Gui, Add, Text, w%GuiWidth% vKeysToPress, Current Key: 
Gui, Add, Text, w%GuiWidth% r2 vNextKeys,

Gui, Tab, 4
Gui, Add, Button, gPlay, Numpad1: play
Gui, Add, Button, gTogglePause, Numpad2: pause/resume
Gui, Add, Button, gStop, Numpad3: stop
Gui, Add, Button, gReopen, Numpad0: reopen script
Gui, Add, Text,, skidded (edited) by yx
Gui, Add, Checkbox, vPrMode, Practice mode


Gui, Show, x%GuiX%

IsPlaying := False
Paused := False

LoadConfigs()


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
if (no_ignore_n)
{
    PianoMusic := RegExReplace(PianoMusic, "[\n\r/]", " ")
}
else
{
    PianoMusic := RegExReplace(PianoMusic, "[\n\r/]", "")
}

N := 1
prevKeys := ""
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
prevWindow := WinExist("A")
GuiControl, Choose, Tab, |3
Sleep, 1
WinActivateBottom, ahk_id %prevWindow%
IsPlaying := True
while (N := RegExMatch(PianoMusic, "U)(\[.*]|.)", Keys, N))
{
    if (Paused)
    {
        while, (Paused)
        {}
    }
    if (IsPlaying == False)
    {
        break
    }
    KeysDisplay := SubStr(PianoMusic, N, 50)
    GuiControl,, NextKeys, %KeysDisplay%
    N += StrLen(Keys)
    IsTrimmed := False
    if Trim(Keys, "[]") != Keys
    {
        IsTrimmed := True
    }
    Keys := Trim(Keys, "[]")
    StringUpper, DisplayText, Keys
    if (Keys = " ")
    {
        Sleep, KeyDelay * ShortPauseSpeed
    }
    else if (Keys = "|")
    {
        Sleep, KeyDelay * LongPauseSpeed
        if (prevKeys = "|")
        {
            Sleep, KeyDelay * NoteSpeed
        }
    }
    else
    {
        if (is_Upper(Keys))
        {
            GuiControl,, KeysToPress, Current Key: shift + %DisplayText%
            if (not PrMode)
            {
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
            
        }
        else
        {
            GuiControl,, KeysToPress, Current Key: %DisplayText%
            if (not PrMode)
            {
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
        }
        if (PrMode)
        {
            PressedKeys := []
            len := StrLen(Keys)
            Loop, %len%
            {
                Loop
                {
                    Input, OutputVar, I L1 V
                    if (OutputVar != "" and InStr(Keys, OutputVar) and not PressedKeys[OutputVar])
                    {
                        PressedKeys[OutputVar] := True
                        Break
                    }
                    Sleep, 0
                }
                Sleep, 0
            }
        }
    }
    prevKeys := Keys
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
if (Paused)
{
    GuiControl,, Paused, Paused
}
else
{
    GuiControl,, Paused, 
}
Return

Stop:
IsPlaying := False
Paused := False
Sleep, 10
GuiControl,, Paused, 
GuiControl,, NextKeys, 
GuiControl,, Progress, 
GuiControl,, KeysToPress, 
prevWindow := WinExist("A")
GuiControl, Choose, Tab, |1
Sleep, 1
WinActivateBottom, ahk_id %prevWindow%
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

GuiClose:
ExitApp
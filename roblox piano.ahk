#SingleInstance, force
StringCaseSense, On

Is_Upper(str) {
  return (str >= "A") and (str <= "Z")
}

Gui, +AlwaysOnTop
Gui, Font, s12 Bold, Century Gothic
GuiControl, Font, MyEdit

Gui, Add, Text,, BPM (beats per minute)
Gui, Add, Edit, w200 vBPM, 100
Gui, Add, Text,, music sheet (keys to press)
Gui, Add, Edit, r5 w200 vPianoMusic
Gui, Add, Text,, Numpad1: play
Gui, Add, Text,, Numpad2: pause/resume
Gui, Add, Text,, Numpad3: reopen script
Gui, Add, Text,, skidded (edited) by yx
Gui, Add, Text, xm y+10 w200 vKeysToPress, Current Key: 
Gui, Show

Numpad1::
Gui, Submit, Nohide
PianoMusic := RegExReplace(PianoMusic, "[\n\r/-]", " ")
KeyDelay := (60000 / BPM)
N := 1
while (N := RegExMatch(PianoMusic, "U)(\[.*]|.)", Keys, N))
{
    N += StrLen(Keys)
    Keys := Trim(Keys, "[]")
    if (Keys = " ")
    {
        Sleep, KeyDelay * 0.3
    }
    else if (Keys = "|")
    {
        Sleep, KeyDelay
    }
    else if (Is_Upper(Keys))
    {
        GuiControl,, KeysToPress, Current Key: shift + %Keys%
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
        GuiControl,, KeysToPress, Current Key: %Keys%
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
newScript := A_ScriptDir . "\roblox piano.ahk"
Run, %newScript%
return

Numpad2::
Pause
Suspend
return

GuiClose:
ExitApp
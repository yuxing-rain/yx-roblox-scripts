#Requires AutoHotkey v2.0
#SingleInstance Off

CoordMode "Mouse", "Screen"
SendMode "Event"
SetKeyDelay -1
SetMouseDelay -1
FileEncoding "UTF-8"
#MaxThreadsPerHotkey 99999

MyGui := Gui("+AlwaysOnTop")
MyGui.SetFont("s12", "Consolas")

MyGui.OnEvent("Close", (*) => ExitApp())

MyGui.Add("Text", , "Spammer v2 - Seele")
MyGui.Add("Text", , "open multi macros to spam multi keys")

MyGui.Add("Text", , "`nHotkey:")
MyHk := MyGui.Add("Hotkey", "w200")

MyGui.Add("Text", , "`nKey to spam:")
MyGui.Add("Text", , "left click: LButton; right click: RButton; `nkeyboard buttons: small letter")
MyEdit1 := MyGui.Add("Edit", "w200")

MyGui.Add("Text", , "`nDelay:")
MyGui.Add("Text", , "-1 for very little delay; -2 for no delay (might cause lag)")
MyEdit2 := MyGui.Add("Edit", "w200", "0")

MyGui.Add("Text", , "`n")
MyBtn := MyGui.Add("Button",, "Confirm")

MyBtn.OnEvent("Click", Toggle)

Hk := ""
Key := ""
Delay := 0

Toggle(*) {
    global
    if Hk
        Hotkey("$" Hk, "Off")
    Hk := MyHk.Value
    Key := MyEdit1.Value
    Delay := MyEdit2.Value

    Hotkey("$" Hk, (*) => MyFunc(Hk, Key, Delay), "On")
}

MyFunc(hk, key, delay) {
    static isdoing := isdoing ?? false
    if isdoing
        return
    isdoing := true

    count := 0
    while GetKeyState(hk, "P") {
        Send("{" key "}")
        if delay > -1 {
            Sleep(delay)
        } else if delay == -1{
            count++
            if Mod(count, 10) == 0 {
                Sleep(1)
                count := 0
            }
        }
    }
    isdoing := false
}

MyGui.Show("AutoSize Center")
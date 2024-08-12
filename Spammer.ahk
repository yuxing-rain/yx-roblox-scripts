#Requires AutoHotkey v2.0
#SingleInstance Off

CoordMode "Mouse", "Screen"
SendMode "Event"
SetKeyDelay -1
SetMouseDelay -1
FileEncoding "UTF-8"
#MaxThreadsPerHotkey 99999

MyGui := Gui("+AlwaysOnTop")
MyGui.SetFont("s" 12 " c0xC5C5C5", "Consolas")

MyGui.BackColor := "222222"

MyGui.OnEvent("Close", (*) => ExitApp())

MyGui.Add("Text", , "Spammer v1.1 - Seele")
MyGui.Add("Text", , "open multi macros to spam multi keys")
MyGui.Add("Text", , "`nHotkey:")
MyHk := MyGui.Add("Hotkey")
MyGui.Add("Text", , "`nKey to spam:")
MyGui.Add("Text", , "left click: LButton; right click: RButton; `nkeyboard buttons: small letter")
MyEdit := MyGui.Add("Edit")
MyGui.Add("Text", , "`n")
MyBtn := MyGui.Add("Button",, "Confirm change hotkey and key to spam")

MyBtn.OnEvent("Click", Toggle)

oldHk := ""

oldEdit := ""

Toggle(*) {
    global
    if oldHk
        Hotkey("$" oldHk, "Off")
    oldHk := MyHk.Value
    oldEdit := MyEdit.Value

    Hotkey("$" oldHk, (*) => Spam(oldHk, oldEdit), "On")
}

Spam(hk, edit) {
    static isdoing := isdoing ?? false
    if isdoing
        return
    isdoing := true
    while GetKeyState(hk, "P") {
        Send("{" edit "}")
    }
    isdoing := false
}

MyGui.Show("AutoSize Center")
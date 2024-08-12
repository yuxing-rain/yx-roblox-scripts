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

MyGui.Add("Text", , "Flicker v1 - Seele")
MyGui.Add("Text", , "`nHotkey:")
MyHk := MyGui.Add("Hotkey")
MyGui.Add("Text", , "`nSensitivity:")
MyGui.Add("Text", , "change it to turning abt 110 degree")
MyEdit := MyGui.Add("Edit", , "1000")
MyEdit.SetFont("c000000")
MyGui.Add("Text", , "`n")
MyBtn := MyGui.Add("Button",, "Confirm change hotkey and sens to flick")

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
        BtMouseMove(-edit, 0, true)
        Sleep(1)
        BtMouseMove(edit, 0, true)
        Sleep(2)
    }
    isdoing := false
}

MyGui.Show("AutoSize Center")

BTwinScaleX := 65535 / A_ScreenWidth
BTwinScaleY := 65535 / A_ScreenHeight
BtMouseMove(dx, dy, rel := false) {
    if rel
        DllCall("mouse_event", "UInt", 0x0001, "Int", dx, "Int", dy)
    else
    {
        DllCall("mouse_event", "UInt", 0x8000 | 0x0001, "Int", dx * BTwinScaleX, "Int", dy * BTwinScaleY)
        MouseMove(dx, dy)
    }
}
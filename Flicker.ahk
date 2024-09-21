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

MyGui.Add("Text", , "Flicker v2 - Seele")

MyGui.Add("Text", , "`nHotkey:")
MyHk := MyGui.Add("Hotkey", "w200")

MyGui.Add("Text", , "`nSensitivity:")
MyGui.Add("Text", , "change it to turning abt 170 degree")
MyEdit1 := MyGui.Add("Edit", "w200", "1000")

MyGui.Add("Text", , "`nDelay:")
MyGui.Add("Text", , "16 is good")
MyEdit2 := MyGui.Add("Edit", "w200", "16")

MyGui.Add("Text", , "`n")
MyBtn := MyGui.Add("Button",, "Confirm")

MyBtn.OnEvent("Click", Toggle)

Hk := ""
Sens := 0
Delay := 0

Toggle(*) {
    global
    if Hk
        Hotkey("$" Hk, "Off")
    Hk := MyHk.Value
    Sens := MyEdit1.Value
    Delay := MyEdit2.Value

    Hotkey("$" Hk, (*) => MyFunc(Hk, Sens, Delay), "On")
}

MyFunc(Hk, Sens, Delay) {
    static isdoing := isdoing ?? false
    if isdoing
        return
    isdoing := true
    while GetKeyState(Hk, "P") {
        BtMouseMove(-Sens, 0, true)
        Sleep(Delay)
        BtMouseMove(Sens, 0, true)
        Sleep(Delay)
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
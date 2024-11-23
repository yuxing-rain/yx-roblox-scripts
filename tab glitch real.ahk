#Requires AutoHotkey v2.0
#SingleInstance Force

CoordMode "Mouse", "Window"

tabbing := false
PID := 0


_ArrayFind(this, value) {
    for i, v in this {
        if v = value
            return i
    }
}
Array.Prototype.DefineProp("Find", { Call: _ArrayFind })
_ArrayRemove(this, value) {
    for i, v in this {
        if v = value {
            this.RemoveAt(i)
        }
    }
}
Array.Prototype.DefineProp("remove", { Call: _ArrayRemove })

SuspendedPID := []
ProcessSuspendToggle(PID, bool := false) {
    h := DllCall("OpenProcess", "uInt", 0x1F0FFF, "Int", 0, "Int", PID)
    if !h
        return
    if bool {
        if SuspendedPID.Find(PID)
            return
        DllCall("ntdll.dll\NtSuspendProcess", "Int", h)
        SuspendedPID.Push(PID)
    } else {
        DllCall("ntdll.dll\NtResumeProcess", "Int", h)
        SuspendedPID.Remove(PID)
    }
}

$~*RButton:: {
    global
    MouseGetPos &x, &y
    if y < 20 {
        tabbing := true
        PID := WinGetPID("A")
        ProcessSuspendToggle(PID, true)
        while tabbing {
            Sleep(1)
        }
        ProcessSuspendToggle(PID, false)
    }
}

$~*RButton Up:: {
    global
    tabbing := false
}
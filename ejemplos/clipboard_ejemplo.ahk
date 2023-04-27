#Requires AutoHotkey v2.0

^+k::
{
    ClipSave := ClipboardAll()
    A_Clipboard := "" 
    Send "^c" 
    if ClipWait(1)
    {
      
        A_Clipboard := "<i>" A_Clipboard "</i>"
        Send "^v" 
        Sleep 500 
    }
    A_Clipboard := ClipSave 
    ClipSave := ""
}
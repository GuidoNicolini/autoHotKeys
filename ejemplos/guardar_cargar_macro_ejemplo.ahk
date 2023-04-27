
mapa := Map()
mapa.Set(1,"El")
mapa.Set(1,"Ejemplo")

^s::{
    control_hwnd := ControlGetHwnd("Edit1", "ahk_class Notepad")
    for k, v in mapa {
        nota := k "," v
        EditPaste(nota,control_hwnd)
    }
    MsgBox("Macro guardada")

}

^l::{
    nombreMacro := InputBox("Ingrese la direccion de la Macro entre comillas").value
    direccionMacro := "C:\Users\guido\OneDrive\Escritorio\" nombreMacro ".txt"
    loop read, direccionMacro{
        linea := A_LoopReadLine
        arrayLinea := StrSplit(linea,",")
        mapa.Set(arrayLinea[1], arrayLinea[2])
    }
    MsgBox("Macro cargada")
 
}
#Requires AutoHotkey v2.0


mapa := Map()
config := Map()
config.Set("velocidad",5)

CoordMode "Mouse", "Screen"

^z:: {

    ejecutor(config.Get("velocidad"))

}

^x:: {
    repetir := InputBox("Repetir cantidad").value
    bucle := 0
    while (bucle < repetir) {
        ejecutor(config.Get("velocidad"))
        bucle := bucle + 1
    }
}

^NumpadAdd:: {
    guardarVariables()
}

^s::{
    control_hwnd := ControlGetHwnd("Edit1", "ahk_class Notepad")
    for k, v in mapa {
        nota := k "," v[1] "," v[2] "," v[3] "," v[4] "`n"
        EditPaste(nota,control_hwnd)
    }
    MsgBox("Macro guardada")

}

^l::{
    nombreMacro := InputBox("Ingrese la direccion de la Macro entre comillas").value
    direccionMacro := "C:\Users\guido\OneDrive\Escritorio\Macros\" nombreMacro ".txt"
    loop read, direccionMacro{
        linea := A_LoopReadLine
        arrayLinea := StrSplit(linea,",")
        mapa.Set(arrayLinea[1], [arrayLinea[2], arrayLinea[3], arrayLinea[4], arrayLinea[5]])
    }
    MsgBox("Macro cargada")
 
}

^o::{
   velocidadMouse :=  InputBox("Velocidad del mouse entre 0 ~ 100").value

   config.Set("velocidad", velocidadMouse)
   MsgBox("configuraciones completadas")
}



^p:: {
    mapa.Clear
    MsgBox("Mapa limpiado")
}

guardarVariables() {

    MouseGetPos &xpos, &ypos 
    x := xpos
    y := ypos
    cantidad := InputBox("Cantidad").value
    dormir := InputBox("Sleep en milisegundos").value

    contador := mapa.Count + 1
    mapa.Set(contador, [x, y, cantidad, dormir])
}

ejecutor(velocidad) {
    for k, v in mapa {
        MouseMove v[1], v[2], velocidad
        text := "{click " v[3] "}"
        Send text
        sleep v[4]
    }
}
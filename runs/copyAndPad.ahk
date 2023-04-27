#Requires AutoHotkey v2.0

mapa := Map()


F1 & Numpad1::{
    guardar(1)
}

F2 & Numpad1::{
    enviar(1)
}

;***************************

F1 & Numpad2::{
    guardar(2)
}

F2 & Numpad2::{
    enviar(2)
}

;***************************

F1 & Numpad3::{
    guardar(3)
}

F2 & Numpad3::{
    enviar(3)
}


;***************************


F1 & Numpad4::{
    guardar(4)
}

F2 & Numpad4::{
    enviar(4)
}


;***************************

F1 & Numpad5::{
    guardar(5)
}

F2 & Numpad5::{
    enviar(5)
}


;***************************


F1 & Numpad6::{
    guardar(6)
}

F2 & Numpad6::{
    enviar(6)
}


;***************************


F1 & Numpad7::{
    guardar(7)
}

F2 & Numpad7::{
    enviar(7)
}

;***************************

F1 & Numpad8::{
    guardar(8)
}

F2 & Numpad8::{
    enviar(8)
}

;***************************

F1 & Numpad9::{
    guardar(9)
}

F2 & Numpad9::{
    enviar(9)
}

;***************************

F1 & Numpad0::{
   mostrar()
}

F2 & Numpad0::{
    mostrarEnviar()
}



;***********************************

enviar(numero){
    SendText(mapa.Get(numero))
}

guardar(numero){
    ClipSave := ClipboardAll()
    A_Clipboard := ""
    Send "^c"
    if ClipWait(1){
        mapa.Set(numero,A_Clipboard)
    }
    A_Clipboard := ClipSave
    ClipSave := ""
}

mostrarEnviar(){

    input := mostrar()

    seleccionado := Number(Input)


    enviar(seleccionado)
}

mostrar(){
    texto := ""
    For k,v in mapa
        texto := texto k ":  " v "`n"

    input := InputBox(texto,,"w1200 h800").value

    return input
}
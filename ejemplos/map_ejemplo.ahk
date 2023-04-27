#Requires AutoHotkey v2.0



^q::{
    mapa := Map()
    mapa["valor1"] := "10"
    myVar := mapa.Get("valor1")
    MsgBox(myVar)
}


clrs := Map()
^a::{
    
    clrs["Red"] := "ff0000"
    clrs["Green"] := "00ff00"
    clrs["Blue"] := "0000ff"
    for clr in Array("Blue", "Green")
    MsgBox clrs[clr]
}
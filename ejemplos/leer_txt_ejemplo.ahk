#Requires AutoHotkey v2.0

arr := []

^q::{

loop read, "E:\DescargasDisco\magia.txt"
   arr.Push(A_LoopReadLine)
    MsgBox("hola")

    for index,element in arr
        for index in second in element
        MsgBox(second)
}
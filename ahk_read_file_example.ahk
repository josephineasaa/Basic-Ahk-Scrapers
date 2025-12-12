^j::
{
    
    Loop, read, "C:\Users\tomlam\Desktop\ahk_test\file_list.csv"
    {
        Loop, Parse, A_LoopReadLine, A_Tab
        {
            MsgBox "Index: " A_Index, "Value: " A_LoopField 
        }
    }
}
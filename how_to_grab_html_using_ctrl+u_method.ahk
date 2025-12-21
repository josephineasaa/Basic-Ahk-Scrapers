; GRABBING THE HTML OF EACH YEAR LINKS 

;read the content of the file line by line 
;every line read as assigned as the link
;run each link, scroll down and up a bit, send ctrl+u to open the source page
;empty the clipboard, send ctrl+c to copy and paste the content of the source page into a new file
;the file of each html takes up the year as its file name (starts from 33rd character up to the fourth character thereafter)
;the files are saved to in a folder

#Requires AutoHotkey v2.0

Persistent

global paused := false

ReadFile(Path) {
    fileContent := []
    content := FileRead(Path)
    for line in StrSplit(content, "`n", "`r") {
        if (line != "") {
            fileContent.Push(line)
        }
    }
    return fileContent
}

PauseToggle() {
    global paused
    paused := !paused
    if paused {
        ToolTip("Script Paused")
    } else {
        ToolTip("Script Resumed")
    }
    Sleep 1000
    ToolTip("")
}

LogMessage(message) {
    FileAppend(message "`n", "scraper.log", "UTF-8")
}

folderName := "ny_year_links_htmls"
folderPath := A_WorkingDir "\" folderName
if !DirExist(folderPath) {
    DirCreate(folderPath)
}

FilePath := "ny_year_links.txt"
links := ReadFile(FilePath)

for link in links {
    while paused {
        Sleep 100
    }

    date := Substr(link, 33, 4)
    filename := folderPath . "\" . date . ".html"

    LogMessage("Processing link: " link)
    LogMessage("Saving to file: " filename)
    
    Run(link)
    Sleep 5000
    Send("{PgDn}")
    Sleep 5000
    Send("{PgUp}")
    Sleep 5000

    Send("^u")
    Sleep 7000
    Send("{PgDn}")
    Sleep 2000
    Send("{PgDn}")
    Sleep 2000
    Send("^a")
    Sleep 5000
    A_Clipboard := ""
    Sleep 5000
    Send("^c")
    ClipWait(6000)

    if (A_Clipboard == "") {
        LogMessage("Clipboard is empty. Copy failed for " link)
    } else {
        if !FileExist(folderPath) {
            LogMessage("Creating folder: " folderPath)
            DirCreate(folderPath)
        }
        
        LogMessage("Appending to file: " filename)
        FileAppend(A_Clipboard, filename, "UTF-8")
        Sleep 5000
        LogMessage("Copied content successfully to " filename)
    }

    Sleep 1000
    Send("^w")
    Sleep 1000
    Send("^w")
    Sleep 1000
}

Esc:: ExitApp()
Pause:: PauseToggle()
ExitApp()

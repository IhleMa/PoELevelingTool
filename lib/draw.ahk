#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%\

LoadSteps(){
    global

    steps := []

    Loop, Files, %A_ScriptDir%\steps\*.txt, R
    {
        FileRead, curStep, %A_LoopFileFullPath%
        steps.Push(curStep)
    }
}

DrawSteps(ByRef stepID) {
    global

    

    Gui, Steps:Destroy
    local width = 250

    Gui, Steps:-Caption
    Gui, Steps:-dpiscale 
    Gui, Steps:+AlwaysOnTop
    Gui, Steps:+ToolWindow
    Gui, Steps:Font, 72s
    Gui, Steps:Add, Text,, % stepID . " / " steps.MaxIndex()
    Gui, Steps:Add, Text, % +Wrap "w" . width, % steps[stepID]

    
    Gui, Steps:Show, % "x" . A_ScreenWidth - (width + 10) . " y10" . " NoActivate"
    

}

ToggleSteps() {
    global

    StepsVisible := !StepsVisible
    if(StepsVisible){
        Gui, Steps:Hide
    } Else {

        WinGet, winid , ID
        Gui, Steps:Show, NoActivate

        
        WinActivate, ahk_pid %winid%
    }

    
}

DrawTest() {
    global

    TestString :=""

    local width = 500

    Gui, Test:-Caption
    Gui, Test:-dpiscale 
    Gui, Test:+AlwaysOnTop
    Gui, Test:+ToolWindow
    Gui, Test:Font, 72s
    Gui, Test:Add, Text,, This is a fucking test
    Gui, Test:Show, % "x" . A_ScreenWidth - width . " y10"
}

ToggleTest() {
    global

    TestVisible := !TestVisible
    if(TestVisible){
        Gui, Test:Hide
    } Else {

        WinGet, winid , ID
        Gui, Test:Show, NoActivate

        
        WinActivate, ahk_pid %winid%
    }

    
}
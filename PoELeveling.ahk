#SingleInstance, force

#Include, lib/draw.ahk

IfNotExist, settings.ini
    IniWrite, 1, settings.ini, Settings, curStep

IniRead, curStepID, settings.ini, Settings, curStep

LoadSteps()
DrawSteps(curStepID)


ä::changeCurStepID(1)
ö::changeCurStepID(-1)


changeCurStepID(amount){
    global 

    curStepID += amount
    if(curStepID < 1) {
        curStepID = 1
    }
    
    if(curStepID > steps.MaxIndex()) {
        curStepID = % steps.MaxIndex()
    }
    IniWrite, %curStepID%, settings.ini, Settings, curStep
    DrawSteps(curStepID)
}

x::ToggleSteps()
^x::ExitApp

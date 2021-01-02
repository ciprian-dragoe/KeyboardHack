prepareTestEnvironment()
{
    showtooltip("RUNNING INTEGRATION TESTS", 1000)
    run notepad
    WinWaitActive, ahk_class Notepad, , 2
    WinActivate, ahk_class Notepad, , 2
    IfWinActive, ahk_class Notepad
    {
       WinMaximize
       return true
    }
    
    return false
}

printTestResults(testResults)
{
    result := ""
    for index , test in testResults
    {
        result .= StrReplace(test.description, "_", A_Space) . "`n"
        result .= "Result: " . test.result . "`n"
        result .= "Exp: " . test.expected . "`n"
        result .= "Act: " . test.actual . "`n"
        result .=  "`n`n`n"
    }
    clipboard := result
    send ^v
    sleep 100
}

setDefaultTestEnvironment(testName)
{
    output := "CLEANING | " . testName . " |"
    tooltip % output
    send {escape}
    sleep 200
    send {escape}
    clearText()
    MouseMove, 500, 500
    setTestVariables()
    tooltip
}

clearText()
{
    send ^a
    sleep 300
    send ^x
    sleep 300
    return %clipboard%
}

getSelectedText()
{
    sleep 100
    send ^c
    sleep 100
    return %clipboard%
}

setTestVariables()
{
    clipboard :=
    timeoutFixQuickTypeLeftRightDoubledModifiers := 100
    timeGreaterTimeoutProcessLayoutOnRelease := 500
    timeoutStillSendLayoutKey := 2000
    timerTimeoutStickyKeys := 1000
    modifierDoubledAsClick["leftCtrlClick"] := "lbutton"
    modifierDoubledAsClick["leftShiftClick"] := "lbutton"
    modifierDoubledAsClick["leftWinClick"] := "lbutton"
    modifierDoubledAsClick["leftAltClick"] := "lbutton"
    modifierDoubledAsClick["rightCtrlClick"] := "lbutton"
    modifierDoubledAsClick["rightShiftClick"] := "lbutton"
    modifierDoubledAsClick["rightWinClick"] := "lbutton"
    modifierDoubledAsClick["rightAltClick"] := "lbutton"
    send {lbutton up}
    send {shift up}
    send {ctrl up}
    send {alt up}
    send {win up}
}
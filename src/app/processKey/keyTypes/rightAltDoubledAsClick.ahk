global sendClickOnRightAltClickRelease := false
global isRightAltDoubledAsClickPressed := false
global rightAltActiveBeforeAltClickPress := false
global doubledRightAltMouseHook := 0
global isRightAltClickDown := false



processRightAltDoubledAsClick(state)
{
    if (state)
    {
        doubledRightAltDown()
    }
    else
    {
        doubledRightAltUp()
    }
}

doubledRightAltDown()
{
    if (isRightAltDoubledAsClickPressed)
    {
        return
    }
    
    isRightAltDoubledAsClickPressed := true
    
    if (isRightShiftDoubledAsClickPressed || isLeftWinDoubledAsClickPressed || isRightCtrlDoubledAsClickPressed) {
        resetSendClickOnRightModifierRelease(1)
        setAltState(1)
        setTimer TimerMonitorAltModifierLift, 20
        return
    }

    if (altActive || isLeftCtrlDoubledAsClickPressed || isLeftShiftDoubledAsClickPressed || isLeftWinDoubledAsClickPressed)
    {
        if (isLeftAltDoubledAsClickPressed)
        {
            setAltState(1)
            setTimer TimerMonitorAltModifierLift, 20
        }
        rightAltActiveBeforeAltClickPress := true
        resetSendClickOnLeftModifierRelease(1)
        sendDoubledValueAndReset("rightAltClick", sendClickOnRightAltClickRelease, isRightAltClickDown)
        return
    }
    
    altActive := 1

    if (!layoutKeyPressed && activePressedKeys.Length() = 0)
    {        
        sendClickOnRightAltClickRelease := true
        chooseClickDragActivation("rightAltClick", "mouseDragRightAltActivate", doubledRightAltMouseHook)
        setTimer TimerResetModifierReleaseAction, %timeoutStillSendLayoutKey%
    }
}

mouseDragRightAltActivate(nCode, wParam, lParam)
{
    cancelMouseHook(doubledRightAltMouseHook)
    if (wParam = 0x200)
    {
        sendClickOnRightAltClickRelease := false
        isRightAltClickDown := true
        doubledAction := modifierDoubledAsClick["rightAltClick"]
        send {blind}{%doubledAction% down}
    }
}

doubledRightAltUp()
{
    cancelMouseHook(doubledRightAltMouseHook)
    isRightAltDoubledAsClickPressed := false

    if (rightAltActiveBeforeAltClickPress)
    {
        rightAltActiveBeforeAltClickPress := false
    }
    else
    {
        altActive := 0
    }

    resetDoubledModifierClickDrag("rightAltClick", isRightAltClickDown)
 
    if (sendClickOnRightAltClickRelease)
    {
        sendDoubledValueAndReset("rightAltClick", sendClickOnRightAltClickRelease, isRightAltClickDown)
    }
}
global sendClickOnRightCtrlClickRelease := false
global isRightCtrlDoubledAsClickPressed := false
global repressRightCtrlReleaseCancelCtrlActive := false
global doubledRightCtrlMouseHook := 0
global isRightCtrlClickDown := false



processRightCtrlDoubledAsClick(state)
{
    if (state)
    {
        doubledRightCtrlDown()
    }
    else
    {
        doubledRightCtrlUp()
    }
}

doubledRightCtrlDown()
{
    if (isRightCtrlDoubledAsClickPressed)
    {
        return
    }

    isRightCtrlDoubledAsClickPressed := true

    if (isRightShiftDoubledAsClickPressed || isRightWinDoubledAsClickPressed || isRightAltDoubledAsClickPressed)
    {
        resetSendClickOnRightModifierRelease(1)
        setCtrlState(1)
        return
    }

    if (fixQuickTypeLeftRightDoubledModifiers || layoutKeyPressed || activePressedKeys.Length() > 0)
    {
        if (isAnyLeftModifierPressed())
        {
            continuousPressRightCtrl()
        }
        else if (ctrlActive)
        {
            repressNormalCtrlRelease := true
        }
    }
    else if (isAnyLeftModifierPressed())
    {
        continuousPressRightCtrl()
        sendDoubledValueAndReset("rightCtrlClick", sendClickOnRightCtrlClickRelease, isRightCtrlClickDown)
        return
    }
    else if (ctrlActive)
    {
        sendDoubledValueAndReset("rightCtrlClick", sendClickOnRightCtrlClickRelease, isRightCtrlClickDown)
        repressRightCtrlReleaseCancelCtrlActive := true
        return
    }

    ctrlActive := 1

    sendClickOnRightCtrlClickRelease := true
    chooseClickDragActivation("rightCtrlClick", "mouseDragRightCtrlActivate", doubledRightCtrlMouseHook)
    setTimer TimerResetModifierReleaseAction, %timeoutStillSendLayoutKey%
}

continuousPressRightCtrl()
{
    if (isLeftCtrlDoubledAsClickPressed)
    {
        setCtrlState(1)
    }
    resetSendClickOnLeftModifierRelease(1)
    if (isLeftCtrlDoubledAsClickPressed)
    {
        repressLeftCtrlReleaseCancelCtrlActive := true
    }
}

mouseDragRightCtrlActivate(nCode, wParam, lParam)
{
    cancelMouseHook(doubledRightCtrlMouseHook)
    setTimer TimerResetModifierReleaseAction, OFF
    if (wParam = 0x200)
    {
        sendClickOnRightCtrlClickRelease := true
        isRightCtrlClickDown := true
        doubledAction := modifierDoubledAsClick["rightCtrlClick"]
        send {blind}{%doubledAction% down}
    }
}

doubledRightCtrlUp()
{
    cancelMouseHook(doubledRightCtrlMouseHook)
    isRightCtrlDoubledAsClickPressed := false

    if (repressRightCtrlReleaseCancelCtrlActive)
    {
        repressRightCtrlReleaseCancelCtrlActive := false
    }
    else
    {
        if (repressNormalCtrlRelease || repressLeftCtrlReleaseCancelCtrlActive)
        {
            repressNormalCtrlRelease := false
            repressLeftCtrlReleaseCancelCtrlActive := false
        }
        else
        {
            ctrlActive := 0
            timerMonitorCtrlModifierLift()
        }
    }

    if (sendClickOnRightCtrlClickRelease)
    {
        sendDoubledValueAndReset("rightCtrlClick", sendClickOnRightCtrlClickRelease, isRightCtrlClickDown)
    }
}
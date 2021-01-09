#include  %A_ScriptDir%\app\processKey\keyTypes\modifier.ahk
#include  %A_ScriptDir%\app\processKey\keyTypes\normal.ahk
#include  %A_ScriptDir%\app\processKey\keyTypes\layout.ahk
#include  %A_ScriptDir%\app\processKey\keyTypes\mouseScroll.ahk
#include  %A_ScriptDir%\app\sticky\stickyFailBack.ahk



global keyToSendOnUp
global sendLayoutKey
global lastKeyProcessedAsAlternative
global activePressedKeys := []
global processKeyOnRelease
global lastPressedKey := ""
global lastPressedKeyTime := 0


processKeyDown(key)
{
    if (lastPressedKey != key)
    {
        lastPressedKey := key
        DllCall("QueryPerformanceCounter", "Int64*", lastPressedKeyTime)
    }

    if (processModifierKey(key, 1))
    {
        return
    }
    
    if (key = layoutChangeKey)
    {
        manageLayoutKeyDown(key)
        return
    }

    if (!alternativeLayoutActive)
    {
        layoutKeyActivatesProcessKeyOnRelease := true
        SetTimer, TimerProcessLayoutOnRelease, OFF
        SetTimer, TimerProcessLayoutOnRelease, %timeoutProcessLayoutOnRelease%
    }
    processNormalKey(key)
}

processKeyUp(key)
{
    if (isAhkBugMisreadKeyUp(key))
    {
        debug(key . " BUG IGNORED RELEASE")
        return
    }

    if (processModifierKey(key, 0))
    {
        return
    }

    fixQuickTypeLeftRightDoubledModifiers := true
    SetTimer, TimerFixQuickTypeLeftRightDoubledModifiers, OFF
    SetTimer, TimerFixQuickTypeLeftRightDoubledModifiers, %timeoutFixQuickTypeLeftRightDoubledModifiers%
    
    if (key = layoutChangeKey)
    {
        manageLayoutKeyUp(key)
        return
    }

    if (keyToSendOnUp)
    {
        processKeyOnRelease := false
        layoutKeyActivatesProcessKeyOnRelease := false
        sendLayoutKey := false
        temp := keyToSendOnUp
        keyToSendOnUp := ""
        key := alternativeLayout[temp]
        if (temp = key)
        {
            modifiers := getActiveModifiers()
            send {blind}%modifiers%{%layoutChangeKey%}
        }
        debug(temp . " => " . key . " on release")
        processKeyToSend(key)
    }
    else
    {
        if (key = lastKeyProcessedAsAlternative)
        {
            lastKeyProcessedAsAlternative := ""
        }
        
        removeFromActivePressedKeys(key)
        
        debug(key . "|up")
    }
}

isAhkBugMisreadKeyUp(currentKeyUp)
{
    DllCall("QueryPerformanceCounter", "Int64*", now)
    minimumTimePassBetweenSameKeyDownAndUp := now - lastPressedKeyTime
    if (minimumTimePassBetweenSameKeyDownAndUp > minimumDelayBetweenSameKeyUpAndDown)
    {
        return false
    }
    if (currentKeyUp = lastPressedKey)
    {
        return true
    }

    return false
}
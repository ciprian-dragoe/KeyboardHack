When_leftWinClick_is_pressed_at_release_left_click_is_sent_#801()
{
    simulateTyping("he")
    `expected := setMousePositionToCaret()`
    simulateTyping("llo")
    processKeyDown("leftWinClick")
    sleep 100
    processKeyUp("leftWinClick")
    sleep 100
    
    validateCaretOutput(A_ThisFunc, expected)    
}

When_leftWinClick_is_continuously_pressed_and_layout_key_is_pressed_and_released_space_is_sent_#802()
{
    simulateTyping("hello")
    processKeyDown("leftWinClick")
    sleep 100
    simulateKeyDown("space", 200)
    simulateKeyUp("space", 200)
    processKeyUp("leftWinClick")
    sleep 100
    send {escape 2}

    expected := "hello"
    validateTestOutput(A_ThisFunc , expected)
}

When_leftWinClick_is_continuously_pressed_and_backtick_is_pressed_keyboard_shortcut_is_sent_#803()
{
    simulateTyping("hello ")
    processKeyDown("leftWinClick")
    sleep 100
    simulateKeyDown("``", 100)
    simulateKeyUp("``", 100)
    processKeyUp("leftWinClick")
    sleep 100
        
    actual := clearText()
    expected := "hello INTEGRATION_TEST"
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftWinClick_is_continuously_pressed_and_backtick_is_pressed_left_click_is_not_sent_on_leftWinClick_release_#804()
{
    simulateTyping("he")
    setMousePositionToCaret()
    simulateTyping("llo")
    expected := getCurrentCaretPosition()
    processKeyDown("leftWinClick")
    sleep 100
    simulateTyping("z")
    processKeyUp("leftWinClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)    
}

When_leftWinClick_is_continuously_pressed_and_layout_key_is_pressed_and_backtick_is_sent_on_leftWinClick_release_click_is_not_sent_#805()
{
    simulateTyping("he")
    simulateTyping("llo ")
    processKeyDown("leftWinClick")
    sleep 100
    simulateKeyDown("space", 50)
    simulateKeyDown("``", 50)
    processKeyUp("leftWinClick")
    sleep 100
    simulateKeyUp("space", 50)
    simulateKeyUp("``", 50)
    expected := setMousePositionToCaret()

    validateCaretOutput(A_ThisFunc, expected)
}

When_leftWinClick_is_pressed_and_win_key_is_pressed_and_released_click_is_sent_on_leftWinClick_release_#806()
{
    timerTimeoutStickyKeys := 3000
    simulateTyping("he")
    expected := setMousePositionToCaret()
    simulateTyping("llo")
    processKeyDown("leftWinClick")
    sleep 100
    processKeyDown("lwin")
    sleep 50
    processKeyUp("lwin")
    sleep 700
    processKeyDown("lwin")
    sleep 100
    processKeyUp("lwin")
    sleep 700
    processKeyUp("leftWinClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_leftWinClick_is_pressed_and_alt_key_is_pressed_click_is_sent_on_leftWinClick_release_#807()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    processKeyDown("leftWinClick")
    sleep 100
    simulateKeyDown("lalt", 50)
    processKeyUp("leftWinClick")
    sleep 100
    simulateKeyUp("lalt", 50)
    send {escape 2}

    validateCaretOutput(A_ThisFunc, expected)
}

When_leftWinClick_is_pressed_and_ctrl_key_is_pressed_and_released_click_is_sent_on_leftWinClick_release_#808()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    processKeyDown("leftWinClick")
    sleep 100
    simulateKeyDown("lctrl", 100)
    simulateKeyUp("lctrl", 100)
    processKeyUp("leftWinClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_leftWinClick_is_pressed_and_ctrl_key_is_pressed_click_is_sent_on_leftWinClick_release_#809()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    processKeyDown("leftWinClick")
    sleep 100
    simulateKeyDown("lctrl", 100)
    processKeyUp("leftWinClick")
    sleep 100
    simulateKeyUp("lctrl", 100)

    validateCaretOutput(A_ThisFunc, expected)
}

When_leftWinClick_is_pressed_and_win_key_is_pressed_and_released_click_is_sent_on_leftWinClick_release_#810()
{
    timerTimeoutStickyKeys := 3000
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    processKeyDown("leftWinClick")
    sleep 100
    processKeyDown("lwin")
    sleep 50
    processKeyUp("lwin")
    sleep 700
    processKeyDown("lwin")
    sleep 100
    processKeyUp("lwin")
    sleep 700
    processKeyUp("leftWinClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_leftWinClick_is_pressed_and_win_key_is_pressed_click_is_sent_on_leftWinClick_release_#811()
{
    timerTimeoutStickyKeys := 3000
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    processKeyDown("leftWinClick")
    sleep 100
    processKeyDown("lwin")
    sleep 50
    
    processKeyUp("leftWinClick")
    sleep 100
    processKeyUp("lwin")
    sleep 700
    processKeyDown("lwin")
    sleep 100
    processKeyUp("lwin")
    sleep 700

    validateCaretOutput(A_ThisFunc, expected)
}

When_leftWinClick_is_pressed_and_shift_is_pressed_and_released_click_is_sent_on_leftWinClick_release_#812()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    processKeyDown("leftWinClick")
    sleep 100
    simulateKeyDown("lshift", 100)
    simulateKeyUp("lshift", 100)
    processKeyUp("leftWinClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_leftWinClick_is_pressed_and_shift_is_pressed_click_is_sent_on_leftWinClick_release_#813()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    processKeyDown("leftWinClick")
    sleep 100
    simulateKeyDown("lshift", 100)
    processKeyUp("leftWinClick")
    sleep 100
    simulateKeyUp("lshift", 100)

    validateCaretOutput(A_ThisFunc, expected)
}

When_leftWinClick_is_pressed_and_shift_key_is_pressed_and_layout_key_pressed_and_backtick_pressed_keyboard_shortcut_is_sent_#814()
{
    simulateTyping("hello")
    setMousePositionToCaret()
    simulateTyping(" world")
    processKeyDown("leftWinClick")
    sleep 100
    simulateKeyDown("lshift", 50)
    simulateKeyDown("space", 50)
    simulateKeyDown("``", 50)
    simulateKeyUp("space", 50)
    simulateKeyUp("``", 50)
    simulateKeyUp("lshift", 50)
    processKeyUp("leftWinClick")
    sleep 100
    actual := clearText()
    expected := "hello worldINTEGRATION_TEST"
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}    

When_leftWinClick_is_continuously_pressed_and_layout_key_is_pressed_after_release_left_click_is_not_sent_#815()
{
    simulateTyping("he")
    setMousePositionToCaret()
    simulateTyping("llo")
    processKeyDown("leftWinClick")
    sleep 100
    simulateKeyDown("space", 50)
    simulateKeyUp("space", 50)
    expected := getCurrentCaretPosition()
    processKeyUp("leftWinClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}    

When_leftWinClick_is_continuously_pressed_and_mouse_is_moved_the_text_is_selected_#816()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    processKeyDown("leftWinClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    processKeyUp("leftWinClick")
    sleep 100
    
    actual := getSelectedText()
    expected := "hello "
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftWinClick_pressed_and_mouse_is_moved_and_layout_key_is_pressed_longer_then_timeoutStillSendLayoutKey_space_is_not_sent_on_layout_key_release_#819()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    processKeyDown("leftWinClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateKeyDown("space", timeoutStillSendLayoutKey + 100)
    simulateKeyUp("space", 100)
    processKeyUp("leftWinClick")
    sleep 100

    actual := clearText()
    expected := "hello "

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}    

When_non_modifier_letter_is_released_and_layout_key_continuous_press_in_less_then_timeoutProcessLayoutOnRelease_and_leftWinClick_pressed_and_backtick_pressed_and_released_click_is_not_sent_#820()
{
    simulateTyping("hello ")
    setMousePositionToCaret()
    simulateTyping("world")
    simulateKeyDown("space", 50)
    processKeyDown("leftWinClick")
    sleep 50
    simulateKeyDown("``", 100)
    simulateKeyUp("``", 100)
    expected := getCurrentCaretPosition()
    simulateKeyUp("space", 100)
    processKeyUp("leftWinClick")
    
    sleep 100
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_non_modifier_letter_is_released_and_layout_key_continuous_press_in_less_then_timeoutProcessLayoutOnRelease_and_leftWinClick_continous_press_and_backtick_pressed_and_leftWinClick_released_left_click_is_not_sent_#821()
{
    simulateTyping("hello ")
    setMousePositionToCaret()
    simulateTyping("world")
    simulateKeyDown("space", 50)
    processKeyDown("leftWinClick")
    sleep 50
    simulateKeyDown("``", 100)
    simulateKeyUp("``", 100)
    simulateKeyUp("space", 100)
    processKeyUp("leftWinClick")
    expected := getCurrentCaretPosition()
    
    sleep 100
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_leftWinClick_is_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_leftWinClick_release_#822()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    processKeyDown("leftWinClick")
    sleep timeoutStillSendLayoutKey
    sleep 100
    processKeyUp("leftWinClick")
    sleep 100
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_leftWinClick_action_is_not_lbutton_and_mouse_is_moved_on_release_action_is_sent_instead_of_mouse_click_#825()
{
    modifierDoubledAsClick["leftWinClick"] := "c"
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    processKeyDown("leftWinClick")
    sleep 50
    MouseMove startingPosition.x, startingPosition.y
    processKeyUp("leftWinClick")
    sleep 100
    
    expected := "hello c"
    validateTestOutput(A_ThisFunc , expected)
    modifierDoubledAsClick["leftWinClick"] := "lbutton"
}

When_win_is_pressed_and_leftWinClick_is_continuously_pressed_and_mouse_is_moved_the_text_is_selected_#826()
{
    timerTimeoutStickyKeys := 3000
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    simulateKeyDown("lwin", 100)
    setMousePositionToCaret()
    processKeyDown("leftWinClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    processKeyUp("leftWinClick")
    sleep 100
    simulateKeyUp("lwin", 700)
    send {escape 2}
    sleep 300
    
    actual := getSelectedText()
    expected := "hello "
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftWinClick_is_continuously_pressed_and_mouse_is_moved_and_ctrl_is_pressed_the_text_remains_selected_#827()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    processKeyDown("leftWinClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateKeyDown("lctrl", 100)
    processKeyUp("leftWinClick")
    sleep 100
    simulateKeyUp("lctrl", 100)
    
    actual := getSelectedText()
    expected := "hello "
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftWinClick_is_continuously_pressed_and_mouse_is_moved_and_win_is_pressed_and_released_the_text_remains_selected_#828()
{
    timerTimeoutStickyKeys := 3000
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    processKeyDown("leftWinClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateKeyDown("lwin", 100)
    simulateKeyUp("lwin", 700)
    simulateKeyDown("lwin", 100)
    simulateKeyUp("lwin", 700)
    processKeyUp("leftWinClick")
    sleep 100
    
    actual := getSelectedText()
    expected := "hello "
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}
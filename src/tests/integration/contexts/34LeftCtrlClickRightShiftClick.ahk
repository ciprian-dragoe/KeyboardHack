When_leftCtrlClick_pressed_rightShiftClick_doubled_as_left_pressed_timeout_pass_rightShiftClick_released_THEN_letter_is_typed_at_beginning_#3401()
{
    modifierDoubledAsClick["rightShiftClick"] := "left"
    simulateTyping("hello")
    processKeyDown("leftCtrlClick")
    sleep 100
    processKeyDown("rightShiftClick")
    sleep 100
    sleep %timeoutStillSendLayoutKey%
    processKeyUp("leftCtrlClick")
    sleep 100
    processKeyUp("rightShiftClick")
    sleep 100
    expected := "hello"

    validateTestOutput(A_ThisFunc , expected)
}

When_leftCtrlClick_doubles_as_b_pressed_rightShiftClick_doubled_as_c_pressed_leftCtrlClick_released_rightShiftClick_released_THEN_c_letter_is_sent_#3402()
{
    modifierDoubledAsClick["leftCtrlClick"] := "b"
    modifierDoubledAsClick["rightShiftClick"] := "c"
    simulateTyping("hello")
    processKeyDown("leftCtrlClick")
    sleep 100
    processKeyDown("rightShiftClick")
    sleep 100
    processKeyUp("leftCtrlClick")
    sleep 100
    processKeyUp("rightShiftClick")
    sleep 100
    expected := "helloc"

    validateTestOutput(A_ThisFunc , expected)
}

When_leftCtrlClick_pressed_rightShiftClick_press_and_releasedTHEN_word_is_typed_at_beginning_#3403()
{
    setMousePositionToCaret()
    simulateTyping("hello")
    processKeyDown("leftCtrlClick")
    sleep 100
    processKeyDown("rightShiftClick")
    sleep 100
    processKeyUp("leftCtrlClick")
    sleep 100
    processKeyUp("rightShiftClick")
    sleep 100
    simulateTyping("w")
    expected := "whello"

    validateTestOutput(A_ThisFunc , expected)
}

When_rightCtrlClick_pressed_leftShiftClick_pressed_mouse_moved_until_second_word_THEN_only_first_word_is_selected_#3404()
{
    setMousePositionToCaret()
    simulateTyping("hello")
    destination := getCurrentCaretPosition()
    simulateTyping(" world")
    processKeyDown("rightCtrlClick")
    sleep 100
    processKeyDown("leftShiftClick")
    sleep 100
    MouseMove destination.x, destination.y
    processKeyUp("rightCtrlClick")
    sleep 100
    processKeyUp("leftShiftClick")
    sleep 100
    actual := getSelectedText()

    expected := "hello "
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

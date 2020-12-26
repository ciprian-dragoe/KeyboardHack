#include %A_ScriptDir%\tests\helpers\simulators.ahk
#include %A_ScriptDir%\tests\helpers\typingValidators.ahk
#include %A_ScriptDir%\tests\helpers\caretValidators.ahk
#include %A_ScriptDir%\tests\integration\contexts\1sticky.ahk
#include %A_ScriptDir%\tests\integration\contexts\2shortcuts.ahk
#include %A_ScriptDir%\tests\integration\contexts\3leftShiftClick.ahk
#include %A_ScriptDir%\tests\integration\contexts\4leftCtrlClick.ahk
#include %A_ScriptDir%\tests\integration\contexts\5leftShiftClickLeftCtrlClick.ahk
#include %A_ScriptDir%\tests\integration\contexts\6layoutKey.ahk
#include %A_ScriptDir%\tests\integration\contexts\7remappedLayout.ahk
#include %A_ScriptDir%\tests\integration\contexts\8winClick.ahk
#include %A_ScriptDir%\tests\integration\contexts\9winClickCtrlClick.ahk
#include %A_ScriptDir%\tests\integration\contexts\10winClickShiftClick.ahk
#include %A_ScriptDir%\tests\integration\contexts\11altClick.ahk
#include %A_ScriptDir%\tests\integration\contexts\12altClickCtrlClick.ahk
#include %A_ScriptDir%\tests\integration\contexts\13altClickShiftClick.ahk
#include %A_ScriptDir%\tests\integration\contexts\14altClickWinClick.ahk
#include %A_ScriptDir%\tests\integration\contexts\15rightCtrlClick.ahk
#include %A_ScriptDir%\tests\integration\contexts\16rightCtrlClickLeftCtrlClick.ahk
#include %A_ScriptDir%\tests\integration\contexts\17rightCtrlClickShiftLeftCtrlClick.ahk
#include %A_ScriptDir%\tests\integration\contexts\18leftCtrlClickShiftRightCtrlClick.ahk
#include %A_ScriptDir%\tests\integration\contexts\19leftCtrlClickRightCtrlClick.ahk
#include %A_ScriptDir%\tests\integration\contexts\20rightShiftClick.ahk
#include %A_ScriptDir%\tests\integration\contexts\21rightShiftClickLeftShiftClick.ahk
#include %A_ScriptDir%\tests\integration\contexts\22leftShiftClickRightShiftClick.ahk



global successTestResults := []
global failureTestResults := []

runIntegrationTests()
{
    /*
    ; STICKY
    When_shift_key_is_logically_pressed_and_not_released_for_more_then_stickyTime_shift_and_shiftActive_is_reset_after_stickyTime_#101()
    When_shiftClick_key_is_logically_pressed_and_not_released_for_more_then_stickyTime_shift_is_reset_after_stickyTime_#102()
    When_ctrl_key_is_logically_pressed_and_not_released_for_more_then_stickyTime_ctrl_and_ctrlActive_is_reset_after_stickyTime_#103()
    When_ctrlClick_key_is_logically_pressed_and_not_released_for_more_then_stickyTime_ctrl_is_reset_after_stickyTime_#104()
    When_alt_key_is_logically_pressed_and_not_released_for_more_then_stickyTime_alt_and_altActive_is_reset_after_stickyTime_#105()
    When_lwin_key_is_logically_pressed_and_not_released_for_more_then_stickyTime_lwin_and_winActive_is_reset_after_stickyTime_#106()
    When_layout_key_is_logically_pressed_and_not_released_for_more_then_stickyTime_alternativeLayout_is_reset_after_stickyTime_#107()
    When_processKeyOnRelease_is_set_after_stickyTime_it_is_reset_#108()
    When_shiftClick_key_is_logically_pressed_and_mouse_moved_and_stickyTime_passes_left_click_is_released_#109()
    When_ctrlClick_key_is_logically_pressed_and_mouse_moved_and_stickyTime_passes_left_click_is_released_#110()
    When_non_modifier_key_is_logically_pressed_and_not_released_after_stickyTime_passes_activePressedKeys_is_reset_to_empty_array_#111()
    When_lastKeyProcessedAsAlternative_is_set_after_stickyTime_it_is_reset_#112()
    When_keyToSendOnUp_is_set_after_stickyTime_it_is_reset_#113()
    
    ; SHORTCUTS
    When_key_matches_shortcut_pattern_shortcut_action_is_executed_instead_of_key_#201()
    When_key_matches_shortcut_pattern_and_is_kept_pressed_after_shortcut_action_is_sent_next_layout_key_press_without_release_is_not_processed_as_space_#202()
    
    ; LEFT SHIFT CLICK
    When_leftShiftClick_is_pressed_at_release_left_click_is_sent_#301()
    When_leftShiftClick_is_continuously_pressed_and_layout_key_is_pressed_and_released_space_is_sent_#302()
    When_leftShiftClick_is_continuously_pressed_and_backtick_is_pressed_keyboard_shortcut_is_sent_#303()
    When_leftShiftClick_is_continuously_pressed_and_backtick_is_pressed_left_click_is_not_sent_on_leftShiftClick_release_#304()
    When_leftShiftClick_is_continuously_pressed_and_layout_key_is_pressed_and_backtick_is_sent_on_leftShiftClick_release_click_is_not_sent_#305()
    When_leftShiftClick_is_pressed_and_shift_key_is_pressed_and_released_click_is_sent_on_leftShiftClick_release_#306()
    When_leftShiftClick_is_pressed_and_alt_key_is_pressed_click_is_sent_on_leftShiftClick_release_#307()
    When_leftShiftClick_is_pressed_and_ctrl_key_is_pressed_and_released_click_is_sent_on_leftShiftClick_release_#308()
    When_leftShiftClick_is_pressed_and_ctrl_key_is_pressed_click_is_sent_on_leftShiftClick_release_#309()
    When_leftShiftClick_is_pressed_and_shift_key_is_pressed_and_released_click_is_sent_on_leftShiftClick_release_#310()
    When_leftShiftClick_is_pressed_and_shift_key_is_pressed_click_is_sent_on_leftShiftClick_release_#311()
    When_leftShiftClick_is_pressed_and_shift_is_pressed_and_released_click_is_sent_on_leftShiftClick_release_#312()
    When_leftShiftClick_is_pressed_and_shift_is_pressed_click_is_sent_on_leftShiftClick_release_#313()
    When_leftShiftClick_is_pressed_and_shift_key_is_pressed_and_layout_key_pressed_and_backtick_pressed_keyboard_shortcut_is_sent_#314()
    When_leftShiftClick_is_continuously_pressed_and_layout_key_is_pressed_after_release_left_click_is_not_sent_#315()
    When_leftShiftClick_is_continuously_pressed_and_mouse_is_moved_the_text_is_selected_#316()
    When_leftShiftClick_is_continuously_pressed_and_mouse_is_moved_and_a_letter_is_typed_a_letter_is_not_sent_#317()
    When_leftShiftClick_is_continuously_pressed_and_mouse_is_moved_and_layout_key_is_pressed_space_is_not_sent_on_layout_key_release_#318()
    When_leftShiftClick_pressed_and_mouse_is_moved_and_layout_key_is_pressed_longer_then_timeoutStillSendLayoutKey_space_is_not_sent_on_layout_key_release_#319()
    When_non_modifier_letter_is_released_and_layout_key_continuous_press_in_less_then_timeoutProcessLayoutOnRelease_and_leftShiftClick_pressed_and_backtick_pressed_and_released_click_is_not_sent_#320()
    When_non_modifier_letter_is_released_and_layout_key_continuous_press_in_less_then_timeoutProcessLayoutOnRelease_and_leftShiftClick_continous_press_and_backtick_pressed_and_leftShiftClick_released_left_click_is_not_sent_#321()
    When_leftShiftClick_is_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_leftShiftClick_release_#322()
	When_layout_key_is_pressed_followed_by_leftShiftClick_left_click_is_not_sent_on_leftShiftClick_release_#323()
    When_non_modifier_key_is_pressed_followed_by_leftShiftClick_left_click_is_not_sent_on_leftShiftClick_release_#324()
    When_leftShiftClick_action_is_not_lbutton_and_mouse_is_moved_on_release_action_is_sent_instead_of_mouse_click_#325()
    When_shift_is_pressed_and_leftShiftClick_is_continuously_pressed_and_mouse_is_moved_the_text_is_selected_#326()
    When_leftShiftClick_is_continuously_pressed_and_mouse_is_moved_and_ctrl_is_pressed_the_text_remains_selected_#327()
    When_leftShiftClick_is_continuously_pressed_and_mouse_is_moved_and_shift_is_pressed_and_released_the_text_remains_selected_#328()
    When_leftShiftClick_is_pressed_and_a_letter_pressed_and_released_and_shift_pressed_and_leftShiftClick_released_and_a_letter_pressed_then_caps_a_letter_is_sent_#329()

    ; LEFT CTRL CLICK
    When_leftCtrlClick_is_pressed_at_release_left_click_is_sent_#401()
    When_leftCtrlClick_is_continuously_pressed_and_layout_key_is_pressed_but_not_released_space_is_sent_#402()
    When_leftCtrlClick_is_continuously_pressed_and_a_letter_is_pressed_all_text_is_selected_#403()
    When_leftCtrlClick_is_continuously_pressed_and_a_key_is_pressed_left_click_is_not_sent_on_leftCtrlClick_release_#404()
    When_leftCtrlClick_is_continuously_pressed_and_layout_key_is_pressed_and_key_remapped_as_left_is_sent_on_leftCtrlClick_release_click_is_not_sent_#405()
    When_leftCtrlClick_is_pressed_and_ctrl_key_is_pressed_and_released_click_is_sent_on_leftCtrlClick_release_#406()
    When_leftCtrlClick_is_pressed_and_ctrl_key_is_pressed_click_is_sent_on_leftCtrlClick_release_#407()
    When_leftCtrlClick_is_pressed_and_alt_key_is_pressed_and_released_click_is_sent_on_leftCtrlClick_release_#408()
    When_leftCtrlClick_is_pressed_and_alt_key_is_pressed_click_is_sent_on_leftCtrlClick_release_#409()
    When_leftCtrlClick_is_pressed_and_win_key_is_pressed_and_released_click_is_sent_on_leftCtrlClick_release_#410()
    When_leftCtrlClick_is_pressed_and_win_key_is_pressed_click_is_sent_on_leftCtrlClick_release_#411()
    When_leftCtrlClick_is_pressed_and_shift_is_pressed_and_released_click_is_sent_on_leftCtrlClick_release_#412()
    When_leftCtrlClick_is_pressed_and_shift_is_pressed_click_is_sent_on_leftCtrlClick_release_#413()
    When_leftCtrlClick_is_pressed_and_shift_key_is_pressed_and_layout_key_pressed_and_key_remapped_as_left_key_a_word_is_selected_#414()
    When_leftCtrlClick_is_continuously_pressed_and_layout_key_is_pressed_after_release_left_click_is_not_sent_#415()
    When_leftCtrlClick_is_continuously_pressed_and_mouse_is_moved_the_text_is_selected_#416()
    When_leftCtrlClick_is_continuously_pressed_and_mouse_is_moved_and_a_letter_is_typed_a_letter_is_not_sent_#417()
    When_leftCtrlClick_is_continuously_pressed_and_mouse_is_moved_and_layout_key_is_pressed_space_is_not_sent_on_layout_key_release_#418()
    When_leftCtrlClick_pressed_and_mouse_is_moved_and_layout_key_is_pressed_longer_then_timeoutStillSendLayoutKey_space_is_not_sent_on_layout_key_release_#419()
    When_non_modifier_letter_is_released_and_layout_key_press_in_less_then_timeoutProcessLayoutOnRelease_and_leftCtrlClick_pressed_and_letter_key_alternative_mapped_as_left_key_pressed_and_released_caret_is_moved_#420()
	When_non_modifier_letter_is_released_and_layout_key_press_in_less_then_timeoutProcessLayoutOnRelease_and_leftCtrlClick_press_and_letter_key_pressed_and_released_and_leftCtrlClick_released_left_click_is_not_sent_#421()
    When_leftCtrlClick_is_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_leftCtrlClick_release_#422()
    When_layout_key_is_pressed_followed_by_leftCtrlClick_left_click_is_not_sent_on_leftCtrlClick_release_#423()
    When_non_modifier_key_is_pressed_followed_by_leftCtrlClick_left_click_is_not_sent_on_leftCtrlClick_release_#424()
    When_leftCtrlClick_action_is_not_lbutton_and_mouse_is_moved_on_release_action_is_sent_instead_of_mouse_click_#425()
    When_ctrl_is_pressed_and_leftCtrlClick_is_continuously_pressed_and_mouse_is_moved_the_text_is_selected_#426()
    When_leftCtrlClick_is_continuously_pressed_and_mouse_is_moved_and_ctrl_is_pressed_the_text_remains_selected_#427()
    When_leftCtrlClick_is_continuously_pressed_and_mouse_is_moved_and_ctrl_is_pressed_and_released_the_text_remains_selected_#428()
    When_leftCtrlClick_is_pressed_and_backspace_pressed_and_released_and_ctrl_pressed_and_leftCtrlClick_released_and_backspace_pressed_then_ctrl_and_backspace_is_sent_#429()
    
    ; SHIFT CLICK & CTRL CLICK
    When_leftShiftClick_is_pressed_and_leftCtrlClick_is_pressed_left_click_is_sent_on_leftShiftClick_release_#501()
    When_leftCtrlClick_is_pressed_and_leftShiftClick_is_pressed_click_is_sent_on_leftCtrlClick_release_#502()
    When_leftShiftClick_is_continuously_pressed_and_leftCtrlClick_is_continuously_pressed_and_layout_key_continuously_pressed_and_key_remapped_as_left_key_a_word_is_selected_#503()
    When_leftShiftClick_is_continuously_pressed_and_leftCtrlClick_is_continuously_pressed_and_layout_key_continuously_pressed_and_key_remapped_as_left_key_left_click_is_not_sent_on_leftShiftClick_release_#504()
    When_leftShiftClick_is_continuously_pressed_and_leftCtrlClick_is_continuously_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_leftCtrlClick_release_#505()
    When_leftShiftClick_is_pressed_and_leftCtrlClick_is_pressed_and_released_left_click_is_sent_on_leftShiftClick_release_#506()
    When_leftCtrlClick_is_pressed_and_leftShiftClick_is_pressed_and_released_left_click_is_sent_on_leftCtrlClick_release_#507()
    
    ; LAYOUT
    When_layout_key_is_pressed_and_key_which_is_reMapped_as_left_key_is_sent_cursor_is_moved_to_left_#601()
    When_layout_key_is_pressed_a_key_does_not_introduce_letter_a_#602()
    When_layout_key_is_pressed_less_then_timeoutStillSendLayoutKey_and_during_this_time_no_non_modifier_key_is_pressed_space_is_sent_on_layout_key_up_#603()
    When_layout_key_is_pressed_more_then_timeoutStillSendLayoutKey_and_during_this_time_no_non_modifier_key_is_pressed_space_is_not_sent_on_layout_key_up_#604()
    When_layout_key_is_pressed_less_then_timeoutStillSendLayoutKey_and_during_this_time_non_modifier_key_is_pressed_space_is_not_sent_on_layout_key_up_#605()
    When_layout_key_is_pressed_less_then_timeoutStillSendLayoutKey_and_during_this_time_modifier_key_is_pressed_space_is_sent_on_layout_key_up_#606()
    When_layout_key_is_pressed_continously_for_3_seconds_and_during_this_time_no_non_modifier_key_is_pressed_space_is_not_sent_on_layout_key_up_#607()
    When_non_modifier_key_is_already_pressed_and_layout_key_is_pressed_space_is_sent_before_layout_key_released_#608()
    When_non_modifier_key_is_released_followed_by_layout_key_press_in_less_than_timeoutProcessLayoutOnRelease_followed_by_non_modifier_key_press_which_has_alternative_mapping_followed_by_same_non_modifier_key_release_remapped_key_is_sent_#609()
    When_non_modifier_key_is_released_followed_by_layout_key_press_in_less_than_timeoutProcessLayoutOnRelease_followed_by_non_modifier_key_press_followed_layout_key_release_space_is_sent_followed_by_non_modifier_key_#610()
    When_layout_key_is_pressed_followed_by_non_modifier_key_press_without_release_followed_by_layout_key_release_followed_by_same_non_modifier_key_press_remapped_key_is_sent_only_once_and_no_other_key_#611()
    When_layout_key_is_pressed_followed_by_non_modifier_key_press_followed_by_layout_key_release_followed_by_other_non_modifier_key_press_remapped_key_is_sent_followed_last_non_modifier_key_pressed_#612()
    When_non_modifier_key_is_released_followed_by_layout_key_press_in_less_than_timeoutProcessLayoutOnRelease_followed_by_non_modifier_key_press_without_alternative_mapping_followed_by_same_release_the_key_is_sent_followed_by_space_#613()
    When_letter_is_released_followed_by_layout_key_press_in_less_than_timeoutProcessLayoutOnRelease_followed_by_letter_press_followed_by_different_letter_press_and_release_alternative_key_for_first_and_second_letter_is_sent_#614()
    When_letter_is_released_followed_by_layout_key_press_in_less_than_timeoutProcessLayoutOnRelease_followed_by_letter_press_followed_by_different_letter_press_followed_by_layout_release_space_is_not_sent_#615()
    When_letter_is_released_followed_by_layout_key_press_in_less_than_timeoutProcessLayoutOnRelease_followed_by_letter_press_followed_by_different_letter_press_followed_by_layout_release_alternative_keys_are_sent_for_both_letters_#616()
    When_letter_is_remapped_as_accented_character_is_pressed_accented_character_is_sent_#617()
    When_shift_key_is_pressed_followed_by_letter_remapped_as_accented_character_sibling_accented_character_is_sent_#618()
    When_letter_is_released_followed_by_layout_key_press_in_less_than_timeoutProcessLayoutOnRelease_followed_by_modifier_key_followed_by_letter_shortcut_is_sent_before_letter_release_#619()

    ; REMAPPED LAYOUT
    When_key_which_has_been_remapped_is_pressed_remapped_key_is_sent_instead_#701()
    When_layout_key_is_pressed_followed_by_key_which_has_been_remapped_is_pressed_alternative_of_remapped_key_is_sent_#702()
    When_key_which_has_been_remapped_as_modifier_key_is_pressed_modifier_key_is_sent_instead_#703()
    When_key_which_has_been_remapped_as_modifier_key_is_pressed_followed_by_layout_key_press_followed_by_key_which_has_alternative_mapping_the_alternative_mapped_key_is_sent_#704()
    When_modifer_key_remapped_as_letter_is_pressed_on_release_activePressedKeys_is_reset_#705()
    When_layout_key_pressed_and_modifer_key_remapped_as_letter_is_pressed_on_modifier_key_release_activePressedKeys_is_reset_#706()
    When_layout_key_pressed_and_modifer_key_remapped_as_letter_is_pressed_on_modifier_key_release_alternative_key_is_sent_#707()
    When_layout_key_pressed_followed_by_modifer_key_remapped_as_letter_pressed_followed_by_layout_release_followed_by_same_modifier_press_remapped_letter_is_sent_#708()
    When_layout_key_continuously_pressed_followed_by_letter_alternatively_mapped_as_accented_character_accented_character_is_sent_#709()
    When_layout_key_continuously_pressed_followed_by_shift_key_press_followed_by_letter_alternatively_mapped_as_accented_character_sibling_accented_character_is_sent_#710()
        
    ; WIN CLICK
    When_winClick_is_pressed_at_release_left_click_is_sent_#801()
    When_winClick_is_continously_pressed_and_layout_key_is_pressed_and_released_space_is_sent_#802()
    When_winClick_is_continously_pressed_and_backtick_is_pressed_keyboard_shortcut_is_sent_#803()
    When_winClick_is_continously_pressed_and_backtick_is_pressed_left_click_is_not_sent_on_winClick_release_#804()
    When_winClick_is_continously_pressed_and_layout_key_is_pressed_and_backtick_is_sent_on_winClick_release_click_is_not_sent_#805()
    When_winClick_is_pressed_and_win_key_is_pressed_and_released_click_is_sent_on_winClick_release_#806()
    When_winClick_is_pressed_and_alt_key_is_pressed_click_is_sent_on_winClick_release_#807()
    When_winClick_is_pressed_and_ctrl_key_is_pressed_and_released_click_is_sent_on_winClick_release_#808()
    When_winClick_is_pressed_and_ctrl_key_is_pressed_click_is_sent_on_winClick_release_#809()
    When_winClick_is_pressed_and_win_key_is_pressed_and_released_click_is_sent_on_winClick_release_#810()
    When_winClick_is_pressed_and_win_key_is_pressed_click_is_sent_on_winClick_release_#811()
    When_winClick_is_pressed_and_shift_is_pressed_and_released_click_is_sent_on_winClick_release_#812()
    When_winClick_is_pressed_and_shift_is_pressed_click_is_sent_on_winClick_release_#813()
    When_winClick_is_pressed_and_shift_key_is_pressed_and_layout_key_pressed_and_backtick_pressed_keyboard_shortcut_is_sent_#814()
    When_winClick_is_continously_pressed_and_layout_key_is_pressed_after_release_left_click_is_not_sent_#815()
    When_winClick_is_continously_pressed_and_mouse_is_moved_the_text_is_selected_#816()
    When_winClick_is_continously_pressed_and_mouse_is_moved_and_a_letter_is_typed_a_letter_is_not_sent_#817()
    When_winClick_is_continously_pressed_and_mouse_is_moved_and_layout_key_is_pressed_space_is_not_sent_on_layout_key_release_#818()
	When_winClick_pressed_and_mouse_is_moved_and_layout_key_is_pressed_longer_then_timeoutStillSendLayoutKey_space_is_not_sent_on_layout_key_release_#819()
    When_non_modifier_letter_is_released_and_layout_key_continous_press_in_less_then_timeoutProcessLayoutOnRelease_and_winClick_pressed_and_backtick_pressed_and_released_click_is_not_sent_#820()
    When_non_modifier_letter_is_released_and_layout_key_continous_press_in_less_then_timeoutProcessLayoutOnRelease_and_winClick_continous_press_and_backtick_pressed_and_winClick_released_left_click_is_not_sent_#821()
    When_winClick_is_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_winClick_release_#822()
    When_layout_key_is_pressed_followed_by_winClick_left_click_is_not_sent_on_winClick_release_#823()
    When_non_modifier_key_is_pressed_followed_by_winClick_left_click_is_not_sent_on_winClick_release_#824()
    When_winClick_action_is_not_lbutton_and_mouse_is_moved_on_release_action_is_sent_instead_of_mouse_click_#825()
    When_win_is_pressed_and_winClick_is_continously_pressed_and_mouse_is_moved_the_text_is_selected_#826()
    When_winClick_is_continously_pressed_and_mouse_is_moved_and_ctrl_is_pressed_the_text_remains_selected_#827()
    When_winClick_is_continously_pressed_and_mouse_is_moved_and_win_is_pressed_and_released_the_text_remains_selected_#828()

    ; WIN CLICK & CTRL CLICK
    When_winClick_is_pressed_and_ctrlClick_is_pressed_left_click_is_sent_on_winClick_release_#901()
    When_ctrlClick_is_pressed_and_winClick_is_pressed_click_is_sent_on_ctrlClick_release_#902()
    When_winClick_is_continously_pressed_and_ctrlClick_is_continously_pressed_and_backtick_pressed_keyboard_shortcut_is_sent#903()
    When_winClick_is_continously_pressed_and_ctrlClick_is_continously_pressed_and_backtick_pressed_click_is_not_sent_winClick_release#904()
    When_winClick_is_continously_pressed_and_ctrlClick_is_continously_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_ctrlClick_release_#905()
    When_winClick_is_pressed_and_ctrlClick_is_pressed_and_released_left_click_is_sent_on_winClick_release_#906()
    When_ctrlClick_is_pressed_and_winClick_is_pressed_and_released_left_click_is_sent_on_ctrlClick_release_#907()

    ; WIN CLICK & SHIFT CLICK
    When_winClick_is_pressed_and_shiftClick_is_pressed_left_click_is_sent_on_winClick_release_#1001()
    When_shiftClick_is_pressed_and_winClick_is_pressed_click_is_sent_on_shiftClick_release_#1002()
    When_winClick_is_continously_pressed_and_shiftClick_is_continously_pressed_and_backtick_pressed_keyboard_shortcut_is_sent_#1003()
    When_winClick_is_continously_pressed_and_shiftClick_is_continously_pressed_and_backtick_pressed_click_is_not_sent_winClick_release_#1004()
    When_winClick_is_continously_pressed_and_shiftClick_is_continously_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_shiftClick_release_#1005()
    When_winClick_is_pressed_and_shiftClick_is_pressed_and_released_left_click_is_sent_on_winClick_release_#1006()
    When_shiftClick_is_pressed_and_winClick_is_pressed_and_released_left_click_is_sent_on_shiftClick_release_#1007()
    
    ; ALT CLICK
    When_altClick_is_pressed_at_release_left_click_is_sent_#1101()
    When_altClick_is_continously_pressed_and_layout_key_is_pressed_and_released_space_is_sent_#1102()
    When_altClick_is_continously_pressed_and_backtick_is_pressed_keyboard_shortcut_is_sent_#1103()
    When_altClick_is_continously_pressed_and_backtick_is_pressed_left_click_is_not_sent_on_altClick_release_#1104()
    When_altClick_is_continously_pressed_and_layout_key_is_pressed_and_backtick_is_sent_on_altClick_release_click_is_not_sent_#1105()
    When_altClick_is_pressed_and_alt_key_is_pressed_and_released_click_is_sent_on_altClick_release_#1106()
    When_altClick_is_pressed_and_alt_key_is_pressed_click_is_sent_on_altClick_release_#1107()
    When_altClick_is_pressed_and_ctrl_key_is_pressed_and_released_click_is_sent_on_altClick_release_#1108()
    When_altClick_is_pressed_and_ctrl_key_is_pressed_click_is_sent_on_altClick_release_#1109()
    When_altClick_is_pressed_and_win_key_is_pressed_and_released_click_is_sent_on_altClick_release_#1110()
    When_altClick_is_pressed_and_win_key_is_pressed_click_is_sent_on_altClick_release_#1111()
    When_altClick_is_pressed_and_shift_is_pressed_and_released_click_is_sent_on_altClick_release_#1112()
    When_altClick_is_pressed_and_shift_is_pressed_click_is_sent_on_altClick_release_#1113()
    When_altClick_is_pressed_and_shift_key_is_pressed_and_layout_key_pressed_and_backtick_pressed_keyboard_shortcut_is_sent_#1114()
    When_altClick_is_continously_pressed_and_layout_key_is_pressed_after_release_left_click_is_not_sent_#1115()
    When_altClick_is_continously_pressed_and_mouse_is_moved_the_text_is_selected_#1116()
    When_altClick_is_continously_pressed_and_mouse_is_moved_and_a_letter_is_typed_a_letter_is_not_sent_#1117()
	When_altClick_is_continously_pressed_and_mouse_is_moved_and_layout_key_is_pressed_space_is_not_sent_on_layout_key_release_#1118()
    When_altClick_pressed_and_mouse_is_moved_and_layout_key_is_pressed_longer_then_timeoutStillSendLayoutKey_space_is_not_sent_on_layout_key_release_#1119()
    When_non_modifier_letter_is_released_and_layout_key_continous_press_in_less_then_timeoutProcessLayoutOnRelease_and_altClick_pressed_and_backtick_pressed_and_released_click_is_not_sent_#1120()
    When_non_modifier_letter_is_released_and_layout_key_continous_press_in_less_then_timeoutProcessLayoutOnRelease_and_altClick_continous_press_and_backtick_pressed_and_altClick_released_left_click_is_not_sent_#1121()
    When_altClick_is_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_altClick_release_#1122()
    When_layout_key_is_pressed_followed_by_altClick_left_click_is_not_sent_on_altClick_release_#1123()
    When_non_modifier_key_is_pressed_followed_by_altClick_left_click_is_not_sent_on_altClick_release_#1124()
    When_altClick_action_is_not_lbutton_and_mouse_is_moved_on_release_action_is_sent_instead_of_mouse_click_#1125()
    When_alt_is_pressed_and_altClick_is_continously_pressed_and_mouse_is_moved_the_text_is_selected_#1126()
    When_altClick_is_continously_pressed_and_mouse_is_moved_and_ctrl_is_pressed_the_text_remains_selected_#1127()
    When_altClick_is_continously_pressed_and_mouse_is_moved_and_alt_is_pressed_and_released_the_text_remains_selected_#1128()

    ; ALT CLICK & CTRL CLICK
    When_altClick_is_pressed_and_ctrlClick_is_pressed_left_click_is_sent_on_altClick_release_#1201()
    When_ctrlClick_is_pressed_and_altClick_is_pressed_click_is_sent_on_ctrlClick_release_#1202()
    When_altClick_is_continously_pressed_and_ctrlClick_is_continously_pressed_and_backtick_pressed_keyboard_shortcut_is_sent#1203()
    When_altClick_is_continously_pressed_and_ctrlClick_is_continously_pressed_and_backtick_pressed_click_is_not_sent_altClick_release#1204()
    When_altClick_is_continously_pressed_and_ctrlClick_is_continously_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_ctrlClick_release_#1205()
    When_altClick_is_pressed_and_ctrlClick_is_pressed_and_released_left_click_is_sent_on_altClick_release_#1206()
    When_ctrlClick_is_pressed_and_altClick_is_pressed_and_released_left_click_is_sent_on_ctrlClick_release_#1207()
    
    ; ALT CLICK & SHIFT CLICK
    When_altClick_is_pressed_and_shiftClick_is_pressed_left_click_is_sent_on_altClick_release_#1301()
    When_shiftClick_is_pressed_and_altClick_is_pressed_click_is_sent_on_shiftClick_release_#1302()
    When_altClick_is_continously_pressed_and_shiftClick_is_continously_pressed_and_backtick_pressed_keyboard_shortcut_is_sent_#1303()
    When_altClick_is_continously_pressed_and_shiftClick_is_continously_pressed_and_backtick_pressed_click_is_not_sent_altClick_release_#1304()
    When_altClick_is_continously_pressed_and_shiftClick_is_continously_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_shiftClick_release_#1305()
    When_altClick_is_pressed_and_shiftClick_is_pressed_and_released_left_click_is_sent_on_altClick_release_#1306()
    When_shiftClick_is_pressed_and_altClick_is_pressed_and_released_left_click_is_sent_on_shiftClick_release_#1307()
    
    ; ALT CLICK & WIN CLICK
    When_altClick_is_pressed_and_ctrlClick_is_pressed_left_click_is_sent_on_altClick_release_#1401()
    When_ctrlClick_is_pressed_and_altClick_is_pressed_click_is_sent_on_ctrlClick_release_#1402()
    When_altClick_is_continously_pressed_and_ctrlClick_is_continously_pressed_and_backtick_pressed_keyboard_shortcut_is_sent_#1403()
    When_altClick_is_continously_pressed_and_ctrlClick_is_continously_pressed_and_backtick_pressed_click_is_not_sent_altClick_release_#1404()
    When_altClick_is_continously_pressed_and_ctrlClick_is_continously_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_ctrlClick_release_#1405()
    When_altClick_is_pressed_and_ctrlClick_is_pressed_and_released_left_click_is_sent_on_altClick_release_#1406()
    When_ctrlClick_is_pressed_and_altClick_is_pressed_and_released_left_click_is_sent_on_ctrlClick_release_#1407()

    ; RIGHT CONTROL CLICK
    When_rightCtrlClick_is_pressed_at_release_left_click_is_sent_#1501()
    When_rightCtrlClick_is_continuously_pressed_and_layout_key_is_pressed_but_not_released_space_is_sent_#1502()
    When_rightCtrlClick_is_continuously_pressed_and_a_letter_is_pressed_all_text_is_selected_#1503()
    When_rightCtrlClick_is_continuously_pressed_and_a_key_is_pressed_left_click_is_not_sent_on_rightCtrlClick_release_#1504()
    When_rightCtrlClick_is_continuously_pressed_and_layout_key_is_pressed_and_key_remapped_as_right_is_sent_on_rightCtrlClick_release_click_is_not_sent_#1505()
    When_rightCtrlClick_is_pressed_and_ctrl_key_is_pressed_and_released_click_is_sent_on_rightCtrlClick_release_#1506()
    When_rightCtrlClick_is_pressed_and_ctrl_key_is_pressed_click_is_sent_on_rightCtrlClick_release_#1507()
    When_rightCtrlClick_is_pressed_and_alt_key_is_pressed_and_released_click_is_sent_on_rightCtrlClick_release_#1508()
    When_rightCtrlClick_is_pressed_and_alt_key_is_pressed_click_is_sent_on_rightCtrlClick_release_#1509()
    When_rightCtrlClick_is_pressed_and_win_key_is_pressed_and_released_click_is_sent_on_rightCtrlClick_release_#1510()
    When_rightCtrlClick_is_pressed_and_win_key_is_pressed_click_is_sent_on_rightCtrlClick_release_#1511()
    When_rightCtrlClick_is_pressed_and_shift_is_pressed_and_released_click_is_sent_on_rightCtrlClick_release_#1512()
    When_rightCtrlClick_is_pressed_and_shift_is_pressed_click_is_sent_on_rightCtrlClick_release_#1513()
    When_rightCtrlClick_is_pressed_and_shift_key_is_pressed_and_layout_key_pressed_and_key_remapped_as_right_key_a_word_is_selected_#1514()
    When_rightCtrlClick_is_continuously_pressed_and_layout_key_is_pressed_after_release_left_click_is_not_sent_#1515()
    When_rightCtrlClick_is_continuously_pressed_and_mouse_is_moved_the_text_is_selected_#1516()
    When_rightCtrlClick_is_continuously_pressed_and_mouse_is_moved_and_a_letter_is_typed_a_letter_is_not_sent_#1517()
    When_rightCtrlClick_is_continuously_pressed_and_mouse_is_moved_and_layout_key_is_pressed_space_is_not_sent_on_layout_key_release_#1518()
    When_rightCtrlClick_pressed_and_mouse_is_moved_and_layout_key_is_pressed_longer_then_timeoutStillSendLayoutKey_space_is_not_sent_on_layout_key_release_#1519()
    When_non_modifier_letter_is_released_and_layout_key_press_in_less_then_timeoutProcessLayoutOnRelease_and_rightCtrlClick_pressed_and_letter_key_alternative_mapped_as_right_key_pressed_and_released_caret_is_moved_#1520()
	When_non_modifier_letter_is_released_and_layout_key_press_in_less_then_timeoutProcessLayoutOnRelease_and_rightCtrlClick_press_and_letter_key_pressed_and_released_and_rightCtrlClick_released_left_click_is_not_sent_#1521()
    When_rightCtrlClick_is_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_rightCtrlClick_release_#1522()
    When_layout_key_is_pressed_followed_by_rightCtrlClick_left_click_is_not_sent_on_rightCtrlClick_release_#1523()
    When_non_modifier_key_is_pressed_followed_by_rightCtrlClick_left_click_is_not_sent_on_rightCtrlClick_release_#1524()
    When_rightCtrlClick_action_is_not_lbutton_and_mouse_is_moved_on_release_action_is_sent_instead_of_mouse_click_#1525()
    When_ctrl_is_pressed_and_rightCtrlClick_is_continuously_pressed_and_mouse_is_moved_the_text_is_selected_#1526()
    When_rightCtrlClick_is_continuously_pressed_and_mouse_is_moved_and_ctrl_is_pressed_the_text_remains_selected_#1527()
    When_rightCtrlClick_is_continuously_pressed_and_mouse_is_moved_and_ctrl_is_pressed_and_released_the_text_remains_selected_#1528()
    When_rightCtrlClick_is_pressed_and_backspace_pressed_and_released_and_ctrl_pressed_and_rightCtrlClick_released_and_backspace_pressed_then_ctrl_and_backspace_is_sent_#1529()

    ; RIGHT CONTROL & LEFT CONTROL
    When_rightCtrlClick_is_pressed_leftCtrlClick_doubled_as_a_is_pressed_all_text_is_selected_before_a_leftCtrlClickRelease_#1601()
    When_rightCtrlClick_doubled_as_b_is_pressed_leftCtrlClick_doubled_as_a_is_pressed_and_released_b_is_not_sent_on_RightCtrlClickRelease_#1602()
    When_rightCtrlClick_pressed_leftCtrlClick_pressed_w_letter_typed_THEN_w_is_sent_at_the_beginning_#1603()
    When_rightCtrlClick_pressed_leftCtrlClick_pressed_mouse_moved_until_second_word_THEN_only_first_word_is_selected_#1604()

    ; RIGHT CONTROL & NORMAL SHIFT & LEFT CONTROL
    When_rightCtrlClick_pressed_shift_pressed_leftCtrlClick_doubled_as_left_pressed_a_word_is_selected_before_a_leftCtrlClick_released_#1701()

    ; LEFT CONTROL & NORMAL SHIFT & RIGHT CONTROL
    When_leftCtrlClick_pressed_shift_pressed_rightCtrlClick_doubled_as_left_pressed_a_word_is_selected_before_a_rightCtrlClick_released_#1801()
    When_leftCtrlClick_pressed_shift_pressed_rightCtrlClick_doubled_as_left_pressed_nothing_is_typed_when_a_rightCtrlClick_and_leftCtrlClick_released_#1802()

    ; LEFT CONTROL & NORMAL SHIFT & RIGHT CONTROL
    When_leftCtrlClick_is_pressed_rightCtrlClick_doubled_as_a_is_pressed_all_text_is_selected_before_a_rightCtrlClickRelease_#1901()
    When_leftCtrlClick_doubled_as_b_is_pressed_rightCtrlClick_doubled_as_a_is_pressed_and_released_b_is_not_sent_on_LeftCtrlClickRelease_1902()
    When_leftCtrlClick_pressed_rightCtrlClick_pressed_w_letter_typed_THEN_w_is_sent_at_the_beginning_#1903()
    When_leftCtrlClick_pressed_rightCtrlClick_pressed_mouse_moved_until_second_word_THEN_only_first_word_is_selected_#1904()

    ; RIGHT SHIFT CLICK
    When_rightShiftClick_is_pressed_at_release_right_click_is_sent_#2001()
    When_rightShiftClick_is_continuously_pressed_and_layout_key_is_pressed_and_released_space_is_sent_#2002()
    When_rightShiftClick_is_continuously_pressed_and_backtick_is_pressed_keyboard_shortcut_is_sent_#2003()
    When_rightShiftClick_is_continuously_pressed_and_backtick_is_pressed_right_click_is_not_sent_on_rightShiftClick_release_#2004()
    When_rightShiftClick_is_continuously_pressed_and_layout_key_is_pressed_and_backtick_is_sent_on_rightShiftClick_release_click_is_not_sent_#2005()
    When_rightShiftClick_is_pressed_and_shift_key_is_pressed_and_released_click_is_sent_on_rightShiftClick_release_#2006()
    When_rightShiftClick_is_pressed_and_alt_key_is_pressed_click_is_sent_on_rightShiftClick_release_#2007()
    When_rightShiftClick_is_pressed_and_ctrl_key_is_pressed_and_released_click_is_sent_on_rightShiftClick_release_#2008()
    When_rightShiftClick_is_pressed_and_ctrl_key_is_pressed_click_is_sent_on_rightShiftClick_release_#2009()
    When_rightShiftClick_is_pressed_and_shift_key_is_pressed_and_released_click_is_sent_on_rightShiftClick_release_#2010()
    When_rightShiftClick_is_pressed_and_shift_key_is_pressed_click_is_sent_on_rightShiftClick_release_#2011()
    When_rightShiftClick_is_pressed_and_shift_is_pressed_and_released_click_is_sent_on_rightShiftClick_release_#2012()
    When_rightShiftClick_is_pressed_and_shift_is_pressed_click_is_sent_on_rightShiftClick_release_#2013()
    When_rightShiftClick_is_pressed_and_shift_key_is_pressed_and_layout_key_pressed_and_backtick_pressed_keyboard_shortcut_is_sent_#2014()
    When_rightShiftClick_is_continuously_pressed_and_layout_key_is_pressed_after_release_right_click_is_not_sent_#2015()
    When_rightShiftClick_is_continuously_pressed_and_mouse_is_moved_the_text_is_selected_#2016()
    When_rightShiftClick_is_continuously_pressed_and_mouse_is_moved_and_a_letter_is_typed_a_letter_is_not_sent_#2017()
    When_rightShiftClick_is_continuously_pressed_and_mouse_is_moved_and_layout_key_is_pressed_space_is_not_sent_on_layout_key_release_#2018()
    When_rightShiftClick_pressed_and_mouse_is_moved_and_layout_key_is_pressed_longer_then_timeoutStillSendLayoutKey_space_is_not_sent_on_layout_key_release_#2019()
    When_non_modifier_letter_is_released_and_layout_key_continuous_press_in_less_then_timeoutProcessLayoutOnRelease_and_rightShiftClick_pressed_and_backtick_pressed_and_released_click_is_not_sent_#2020()
    When_non_modifier_letter_is_released_and_layout_key_continuous_press_in_less_then_timeoutProcessLayoutOnRelease_and_rightShiftClick_continuous_press_and_backtick_pressed_and_rightShiftClick_released_right_click_is_not_sent_#2021()
    When_rightShiftClick_is_pressed_more_then_timeoutStillSendLayoutKey_right_click_is_not_sent_on_rightShiftClick_release_#2022()
	When_layout_key_is_pressed_followed_by_rightShiftClick_right_click_is_not_sent_on_rightShiftClick_release_#2023()
    When_non_modifier_key_is_pressed_followed_by_rightShiftClick_right_click_is_not_sent_on_rightShiftClick_release_#2024()
    When_rightShiftClick_action_is_not_lbutton_and_mouse_is_moved_on_release_action_is_sent_instead_of_mouse_click_#2025()
    When_shift_is_pressed_and_rightShiftClick_is_continuously_pressed_and_mouse_is_moved_the_text_is_selected_#2026()
    When_rightShiftClick_is_continuously_pressed_and_mouse_is_moved_and_ctrl_is_pressed_the_text_remains_selected_#2027()
    When_rightShiftClick_is_continuously_pressed_and_mouse_is_moved_and_shift_is_pressed_and_released_the_text_remains_selected_#2028()
    When_rightShiftClick_is_pressed_and_a_letter_pressed_and_released_and_shift_pressed_and_rightShiftClick_released_and_a_letter_pressed_then_caps_a_letter_is_sent_#2029()

    ; RIGHT SHIFT CLICK & LEFT SHIFT CLICK
    When_rightShiftClick_is_pressed_leftShiftClick_doubled_as_d_is_pressed_THEN_D_is_sent_before_a_leftShiftClickRelease_#2101()
    When_rightShiftClick_pressed_leftShiftClick_pressed_THEN_whole_text_is_selected_before_rightShiftClick_release_#2102()
    When_rightShiftClick_doubled_as_d_pressed_leftShiftClick_pressed_rightShiftClick_release_leftShiftClick_release_THEN_d_is_not_sent_#2103()
    When_rightShiftClick_pressed_leftShiftClick_pressed_mouse_moved_until_second_word_THEN_only_first_word_is_selected_#2104()

    ; LEFT SHIFT CLICK & RIGHT SHIFT CLICK
    When_leftShiftClick_is_pressed_rightShiftClick_doubled_as_d_is_pressed_THEN_D_is_sent_before_a_rightShiftClickRelease_#2201()
    When_leftShiftClick_pressed_rightShiftClick_pressed_THEN_whole_text_is_selected_before_leftShiftClick_release_#2202()
    When_leftShiftClick_doubled_as_d_pressed_rightShiftClick_pressed_leftShiftClick_release_rightShiftClick_release_THEN_d_is_not_sent_#2203()
    When_leftShiftClick_pressed_rightShiftClick_pressed_mouse_moved_until_second_word_THEN_only_first_word_is_selected_#2204()

    */



    /*
    */


When_leftCtrlClick_is_pressed_rightCtrlClick_doubled_as_a_is_pressed_all_text_is_selected_before_a_rightCtrlClickRelease_#1901()
    When_leftCtrlClick_doubled_as_b_is_pressed_rightCtrlClick_doubled_as_a_is_pressed_and_released_b_is_not_sent_on_LeftCtrlClickRelease_1902()
    When_leftCtrlClick_pressed_rightCtrlClick_pressed_w_letter_typed_THEN_w_is_sent_at_the_beginning_#1903()
    When_leftCtrlClick_pressed_rightCtrlClick_pressed_mouse_moved_until_second_word_THEN_only_first_word_is_selected_#1904()


    /*
    */
}

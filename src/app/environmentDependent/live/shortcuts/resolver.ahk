#include %A_ScriptDir%\app\environmentDependent\live\shortcuts\resolver\debug.ahk
#include %A_ScriptDir%\app\environmentDependent\live\shortcuts\resolver\rightClick.ahk
#include %A_ScriptDir%\app\environmentDependent\live\shortcuts\resolver\accentedCharacters.ahk
#include %A_ScriptDir%\app\environmentDependent\live\shortcuts\resolver\modifierClick.ahk
#include %A_ScriptDir%\app\environmentDependent\live\shortcuts\resolver\functionKeys.ahk



global resolverAction := object()
resolverAction[500] := func("sendAccentedSibling")
resolverAction[501] := func("rightClick")
resolverAction[502] := func("sendTestMessage")
resolverAction[503] := func("displayDebugData")
resolverAction[504] := func("reloadApp")
resolverAction[505] := func("exit")
resolverAction[506] := func("altModifierPressEmulate")
resolverAction[507] := func("ctrlModifierPressEmulate")
resolverAction[508] := func("winModifierPressEmulate")
resolverAction[509] := func("storeDebugData")
global functionKeysStartIndexMinusOne := 510
resolverAction[511] := func("sendFunctionKey")
resolverAction[512] := func("sendFunctionKey")
resolverAction[513] := func("sendFunctionKey")
resolverAction[514] := func("sendFunctionKey")
resolverAction[515] := func("sendFunctionKey")
resolverAction[516] := func("sendFunctionKey")
resolverAction[517] := func("sendFunctionKey")
resolverAction[518] := func("sendFunctionKey")
resolverAction[519] := func("sendFunctionKey")
resolverAction[520] := func("sendFunctionKey")
resolverAction[521] := func("sendFunctionKey")
resolverAction[522] := func("sendFunctionKey")

processShortcut(index, combination)
{
    resolverAction[index].call(combination, index)
    return
}

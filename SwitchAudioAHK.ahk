#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

^+!F10::
Run, powershell.exe -ExecutionPolicy bypass "C:\ProgramData\AudioSwitch\AudioSwitcher.ps1" -Group quality
return

^+!F11::
Run, powershell.exe -ExecutionPolicy bypass "C:\ProgramData\AudioSwitch\AudioSwitcher.ps1" -Group wireless
return
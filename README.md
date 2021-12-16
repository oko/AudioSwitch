# AudioSwitcher

This is an audio-switching script for swapping between playback/recording device pairs quickly in Windows. I use this to flip between a high-quality DAC/amp/mic setup and a wireless headset.


## Components
* `AudioSwitchAHK.ahk`: an AHK script which binds Ctrl-Shift-Alt-F10 and Ctrl-Shift-Alt-F11 to "quality" and "wireless" groups.
* `AudioSwitcher.ps1`: a Powershell script which actually executes audio switching and contains the configuration of matches/volumes

## Installation

### Prerequisites

* [AutoHotKey](https://www.autohotkey.com/): for keyboard shortcut handling
* [AudioDeviceCmdlets](https://github.com/frgnca/AudioDeviceCmdlets): for management of audio devices in Powershell scripts

### Install

1. Create symlink
	1. Open an administrator command prompt
	2. Create a symlink to wherever you downloaded this repository with `mklink /d C:\ProgramData\AudioSwitch %PATH_TO_REPO%`
2. Create shortcut
    1. Open the Run dialog (`Win-R`) and type `shell:startup` to open your startup items
    2. Create a shortcut to the AHK script by right-clicking, `New -> Shortcut`, and creating a shortcut to `C:\ProgramData\AudioSwitch\AudioSwitchAHK.ahk`
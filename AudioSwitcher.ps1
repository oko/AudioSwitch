[CmdletBinding()]
Param(
    $group
)
#
# Edit the `match=` items to select the devices using PS regex
# Edit the `volume=` items to set the volume for that device class after changing the device
# Copy an entire group to add another device set; you will also need to edit the AHK script to add another shortcut
#
$config = [ordered]@{
    quality = @{
        recording = @{match='.*RODE NT-USB.*'; volume=86};
        playback = @{match='.*Atom.*'; volume=100};
    };
    wireless = @{
        recording = @{match='.*Arctis.*'; volume=100};
        playback = @{match='.*Arctis.*'; volume=100};
    };
}

Import-Module AudioDeviceCmdlets

function Configure-Group {
    Param($group, $groupConfig)

    Get-AudioDevice -list | ? { $_.Type -eq 'Recording'} | ? { $_.Name -match $groupConfig[$group].recording.match } | Set-AudioDevice
    Set-AudioDevice -RecordingVolume $groupConfig[$group].recording.volume

    Get-AudioDevice -list | ? { $_.Type -eq 'Playback'} | ? { $_.Name -match $groupConfig[$group].playback.match } | Set-AudioDevice
    Set-AudioDevice -PlaybackVolume $groupConfig[$group].playback.volume
    Write-Host "Set to ${group} devices"
    Start-Sleep 2.0
}

Configure-Group $group $config
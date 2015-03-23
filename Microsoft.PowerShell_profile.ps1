$EDITOR_PATH = "C:\Program Files (x86)\Vim\vim74\gvim.exe"
$HOSTS_PATH = "C:\Windows\System32\drivers\etc\hosts"
$MAXIMUM_HISTORY_COUNT = 200
$HISTORY_PATH = Join-Path (Split-Path $PROFILE) "history.clixml"


Register-EngineEvent -SourceIdentifier powershell.exiting -SupportEvent -Action {
    Get-History -Count $MAXIMUM_HISTORY_COUNT | Export-Clixml $HISTORY_PATH
}


if (Test-Path $HISTORY_PATH) {
    Import-Clixml $HISTORY_PATH | Add-History
}


Function Start-Editor {
	[CmdletBinding(SupportsShouldProcess=$True,
				   ConfirmImpact='None')]
	Param([String]$Path)
	Process {
		& $EDITOR_PATH $Path
	}
}


Function Edit-HostsFile {
	[CmdletBinding(SupportsShouldProcess=$True,
				   ConfirmImpact='None')]
	Param()
	Process {
		Start-Editor $HOSTS_PATH
	}
}


Import-Alias .\alias.txt

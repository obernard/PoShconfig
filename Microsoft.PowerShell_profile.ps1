$EDITOR_PATH = "C:\Program Files (x86)\Vim\vim74\gvim.exe"
$HOSTS_PATH = "C:\Windows\System32\drivers\etc\hosts"


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

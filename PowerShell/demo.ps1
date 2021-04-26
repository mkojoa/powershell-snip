<#
		Create a PowerShell scheduled task on a remote server in my Active Directory environmentto kick it off every day.
#>

#region Create the testing script
ise C:\Users\MAmeyaw\Desktop\PowerShell\Test-WebService.ps1
& 'C:\Users\MAmeyaw\Desktop\PowerShell\Test-WebService.ps1' -Url 'https://demo.persol-apps.com'

Get-Content -Path 'C:\Users\MAmeyaw\Desktop\PowerShell\MicroServiceMonitor.log'
#endregion

#region Create the scheduled task

## Using the New-ScheduledScript in the PowerShell Gallery
Install-Script New-ScheduledScript -Force

#region Verify no scheduled task
Invoke-Command -ComputerName PSL-APP-VM3 -ScriptBlock { Get-ScheduledTask -TaskName 'MicroService Monitoring' }
#endregion

$parameters = @{
	ScriptFilePath = 'C:\Users\MAmeyaw\Desktop\PowerShell\Test-WebService.ps1'
	LocalScriptFolderPath = 'C:\'
	TaskTriggerOptions = @{
		'Daily' = $true
		'At' = '3Am'
	}
	TaskName = 'MicroService Monitoring'
	TaskRunAsUser = 'persolgh\installmanager'
	TaskRunAsPassword = 'install@bj2013'
	Computername = 'PSL-APP-VM3'
    ScriptParameters = "-Url https://demo.persol-apps.com"
}
New-ScheduledScript.ps1 @parameters
#endregion

#region Verify the scheduled task has been created
Invoke-Command -ComputerName PSL-APP-VM3 -ScriptBlock { Get-ScheduledTask -TaskName 'MicroService Monitoring' }
#endregion

#region Kick off the scheduled task manually on TSDC
Invoke-Command -ComputerName PSL-APP-VM3 -ScriptBlock { Start-ScheduledTask -TaskName 'MicroService Monitoring' }
#endregion

#region Confirm the log file is being written to
Get-Content -Path 'C:\Users\MAmeyaw\Desktop\PowerShell\MicroServiceMonitor.log'
#endregion

<# \\TSDC\c$\ #>
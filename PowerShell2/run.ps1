

# A definition of a general task which takes a script as argument and execute task 
$pathToScript = 'C:\Users\MAmeyaw\Desktop\PowerShell2\Test.ps1'
$ScheduledTaskActionParams = @{
    Execute  = "PowerShell.exe"
    Argument = "-NoLogo -NoProfile -NonInteractive -File `"$pathToScript`""
}
$registerTaskParameters = @{
    Principal = New-ScheduledTaskPrincipal -UserId "$ENV:USERDOMAIN\$ENV:USERNAME"
    Trigger   = New-ScheduledTaskTrigger -Once -At ((Get-Date).AddMinutes(30))
    TaskName  = 'Check email'
    Action    = New-ScheduledTaskAction @ScheduledTaskActionParams
}
Register-ScheduledTask @registerTaskParameters -Force
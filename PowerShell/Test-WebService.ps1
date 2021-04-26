param(
	[Parameter(Mandatory)]
	[ValidateNotNullOrEmpty()]
	[string]$Url,

	[Parameter()]
	[ValidateNotNullOrEmpty()]
	[string]$LogFilePath = 'C:\Users\MAmeyaw\Desktop\PowerShell\MicroServiceMonitor.log'
)
    
## Parse host from URL
$hostname = $url.split('/')[2]

$pass = Get-Content .\securepass.txt | ConvertTo-SecureString -AsPlainText -Force ##sender password
$name = "3c1c2a82ca4aa5" ## sender email
$cred = New-Object System.Management.Automation.PSCredential($name,$pass)



$From = ""
$To = "”
$Cc = ""
$Attachment = "C:\Users\MAmeyaw\Desktop\PowerShell\MicroServiceMonitor.log"
$Subject = "Microservice Monitoring (Critical)"
$Body = "<h2>Guys, </br>Microservices are not responding!</h2><br><br>"
$Body += “Kindly find the attached log file below and take action now!” 
$SMTPServer = "smtp.mailtrap.io"
$SMTPPort = "587"


## Ensure HTTP is up
$now = Get-Date -Format 'MM-dd-yyyy hh:mm:ss'
if (-not (Test-NetConnection -ComputerName $hostname -CommonTCPPort HTTP).TcpTestSucceeded) { 

        $From = "michaelameyaw7@gmail.com"
        $To = "michael.ameyaw@persol.net", "michaelameyaw7@gmail.com”
        $Cc = "meltecksolution@gmail.com"

	Add-Content -Path $LogFilePath -Value "$now - Host [$hostname] is not responding on port 80."

    Send-MailMessage -From $From -to $To -Cc $Cc -Subject $Subject -Body $Body -BodyAsHtml -SmtpServer $SMTPServer -Port $SMTPPort -UseSsl -Credential $cred -Attachments $Attachment

} else {
	Add-Content -Path $LogFilePath -Value "$now - Host [$hostname] is OK."
	$response = Invoke-WebRequest -Uri $url -UseBasicParsing
	if ($response.StatusCode -ne 200) {

        ##send email to client the the service is broken
        $From = "michaelameyaw7@gmail.com"
        $To = "michael.ameyaw@persol.net", "michaelameyaw7@gmail.com”
        $Cc = "meltecksolution@gmail.com"

		Add-Content -Path $LogFilePath -Value "$now - Page [$Url] is broken. HTTP response code was [$($response.StatusCode)]."
        
        Send-MailMessage -From $From -to $To -Cc $Cc -Subject $Subject -Body $Body -BodyAsHtml -SmtpServer $SMTPServer -Port $SMTPPort -UseSsl -Credential $cred -Attachments $Attachment
	} else {
        ## log to a file
		Add-Content -Path $LogFilePath -Value "$now - Page [$Url] OK."
	}
}


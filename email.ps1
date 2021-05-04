$emailSmtpUser = "michaelameyaw7@gmail.com"
$emailSmtpPass = "&kumfipolice@2021"
 
$emailFrom = "persol.demo@gmail.com"
$emailTo = "michaelameyaw7@gmail.com"
$emailcc="michael.ameyaw@persol.net"
 
$emailMessage = New-Object System.Net.Mail.MailMessage($emailFrom,$emailTo)
$emailMessage.cc.add($emailcc)
$emailMessage.Subject = "UMB Test Email"
$emailMessage.Body = "umb test body"
 
$securestring = $emailSmtpPass | ConvertTo-SecureString -AsPlainText -Force

$SMTPClient = New-Object System.Net.Mail.SmtpClient("smtp.gmail.com",587)
$SMTPClient.EnableSsl = $true
$SMTPClient.UseDefaultCredentials = $false
$smtpClient.DeliveryMethod = [Net.Mail.SmtpDeliveryMethod]::Network;
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential($emailSmtpUser,$securestring);

try {

  $SMTPClient.Send($emailMessage)
}
catch [System.Exception] {

      write-host $_.Exception
  
}

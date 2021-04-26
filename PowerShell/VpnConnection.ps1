Add-VpnConnection -Name "mameyaw" -ServerAddress "192.168.0.245" -TunnelType "L2tp" -EncryptionLevel "Required" -AuthenticationMethod Eap -SplitTunneling -AllUserConnection -RememberCredential -EapConfigXmlStream $A.EapConfigXmlStream -PassThru

Get-VpnConnectionTrigger -ConnectionName "mameyaw"
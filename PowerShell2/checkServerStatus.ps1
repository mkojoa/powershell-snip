
    $path = "C:\Users\MAmeyaw\Desktop\PowerShell2\computernames.txt"

    $pclist = Get-Content $path

    foreach ($pc in $pclist) {
        if (test-Connection -ComputerName $pc -Count 2 -Quiet ) {
            Write-Host $pc is online -ForegroundColor Green
        } 
        else {
            Write-Host $pc is offline -ForegroundColor Red
        }
    }
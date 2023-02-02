$eesnimi = Read-Host "Palun sisestage oma eesnimi"
$perenimi = Read-Host "Palun sisestage oma perenimi"
$taisnimi = "$eesnimi.$perenimi"

if (Get-ADUser -F {SamAccountName -eq $taisnimi}) { 
    Remove-ADUser -identity $taisnimi 
    Write-host "$taisnimi konto on kustutatud süsteemist" }
else {
    Write-host "Sellist kasutajat ei ole olemas"
    }

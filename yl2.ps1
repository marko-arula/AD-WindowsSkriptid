# küsime kasutaja andmed
$Eesnimi = Read-Host "Sisesta oma eesnimi"
$Perenimi = Read-Host "Sisesta oma perenimi"
# muudame tähed vaiksemaks
# loome kasutajanime
$KasutajaNimi = $Eesnimi.ToLower() + "." + $Perenimi.ToLower()
# loome taisnimi
$TaisNimi = $Eesnimi.ToLower() + " " + $Perenimi
# Kontrollime valjundiga
Write-Output "Kustutav kasutaja on $($KasutajaNimi)"
# lülitame sUsteemi teaded valja
$ErrorActionPreference = 'SilentlyContinue'
# proovime kustutada otsitud kasutaja
Remove-LocalUser $KasutajaNimi
# kontroll 
if(!$?){
   Write-Output "Tekkinud probleem kasutaja kustutamisega"
} else {
   Write-Output "Kasutaja $($KasutajaNimi) on kustutatud"
}
# Süsteemi teaded tagasi sisse 
$ErrorActionPreference = 'Stop'

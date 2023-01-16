# kasutajanime loomine
$KasutajaNimi = $Eesnimi.ToLower() + "." + $Perenimi.ToLower()
# Taisnime loomine
$Taisnimi = $Eesnimi.ToLower() + " " + $Perenimi
# kirjelduse loomine
$Kirjeldus = "Lokaalne konto - " + $KasutajaNimi
# kontrollime valjundit
Write-Output "Loodav kasutaja on $($KasutajaNimi)"
# süsteemi teated välja
$ErrorActionPreference = 'SilentlyContinue' # !!!
# kasutaja loomine kasutades loodud parooli
New-Localuser $KasutajaNimi -Password $KasutajaParool -FullName $TaisNimi -Description $Kirjeldus
if(!$?){
    Write-Output "Tekkinud probleem kasutaja loomisega"
    # kontrollime kasutaja olemasolu
    Get-LocalUser $KasutajaNimi
    # kui kasutaja on olemas
    if($?){
        Write-Outpu "Kasutaja $($KasutajaNimi) juba eksisteerib"
    }
}
# süsteemi teated sisse
$ErrorActionPreference = 'Stop'
# süsteemi teated välja
$ErrorActionPreference = 'SilentlyContinue'

function Test-AppInstalado {
    param ($Nome)

    $regPaths = @(
        "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*",
        "HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*"
    )

    foreach ($path in $regPaths) {
        if (Get-ItemProperty $path -ErrorAction SilentlyContinue |
            Where-Object { $_.DisplayName -like "*$Nome*" }) {
            return $true
        }
    }
    return $false
}

$PastaInstaladores = Join-Path $PSScriptRoot "APPS"

$Apps = Get-ChildItem $PastaInstaladores -File | Where-Object { $_.Extension -in ".exe", ".msi" }

Write-Host "_______________________________________________________________________________" -ForegroundColor Blue
$banner = @"
                                    _       _____           _        _           
     /\                  /\        | |     |_   _|         | |      | |          
    /  \   _ __  _ __   /  \  _   _| |_ ___  | |  _ __  ___| |_ __ _| | ___ _ __ 
   / /\ \ | '_ \| '_ \ / /\ \| | | | __/ _ \ | | | '_ \/ __| __/ _` | |/ _ \ '__|
  / ____ \| |_) | |_) / ____ \ |_| | || (_) || |_| | | \__ \ || (_| | |  __/ |   
 /_/    \_\ .__/| .__/_/    \_\__,_|\__\___/_____|_| |_|___/\__\__,_|_|\___|_|   
          | |   | |                                                              
          |_|   |_|     
"@
Write-Host $banner -ForegroundColor Blue
Write-Host "                                                      by rchamss" -ForegroundColor Blue
Write-Host "_______________________________________________________________________________" -ForegroundColor Blue
Write-Host ""
foreach ($instalador in $Apps) {

    $NomeApp = [System.IO.Path]::GetFileNameWithoutExtension($instalador.Name)

    Write-Host "Verificando $NomeApp..."

    if (Test-AppInstalado $NomeApp*) {
        Write-Host "$NomeApp ja esta instalado" -ForegroundColor Green
    }
    else {
        Write-Host "$NomeApp nao encontrado. Instalando..." -ForegroundColor Yellow

        Start-Process $instalador.FullName -ArgumentList "/silent /norestart /s /qn" -Wait

        Write-Host "$NomeApp instalado" -ForegroundColor Cyan
    }
}                                                         
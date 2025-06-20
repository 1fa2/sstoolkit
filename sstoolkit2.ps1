# Imposta la cartella di destinazione per i download
$downloadFolder = "$env:USERPROFILE\Downloads\fa's secondary toolkit"
if (!(Test-Path $downloadFolder)) { New-Item -ItemType Directory -Path $downloadFolder }

# Aggiunge l'esclusione in Windows Defender per evitare falsi positivi
try {
    Add-MpPreference -ExclusionPath $downloadFolder
    Write-Host "🛡️ Esclusione aggiunta a Windows Defender per: $downloadFolder" -ForegroundColor Cyan
} catch {
    Write-Host "⚠️ Impossibile aggiungere l'esclusione. Avvia come amministratore." -ForegroundColor Yellow
}

# Elenco dei file da scaricare
$files = @(
    "https://www.voidtools.com/Everything-1.4.1.1027.x86-Setup.exe",
    "https://github.com/txvch/Screenshare-Collector/releases/download/tech/Technical.Utilities.exe",
    "https://github.com/spokwn/Tool/releases/download/v1.1.1/espoukenBitrate.exe",
    "https://www.nirsoft.net/utils/usbdeview.zip",
    "https://downloads.sourceforge.net/project/systeminformer/systeminformer-3.2.25011-release-setup.exe",
    "https://www.nirsoft.net/utils/lastactivityview.zip",
    "https://osforensics.com/downloads/OSForensics.exe",
    "https://github.com/nay-cat/dpsanalyzer/releases/download/1.3/dpsanalyzer.exe",
    "https://github.com/nay-cat/DebuggerFinder/releases/download/v2/DebuggerFinder.exe",
    "https://d1kpmuwb7gvu1i.cloudfront.net/AccessData_FTK_Imager_4.7.1.exe",
    "https://download1523.mediafire.com/omy5e27x323ggrnl1Iq2VFGh0o8b5jU8TXv7qI7GVrLPtCkc5D1cSh6oqF8UpxBRlPqe2lEZa9U6wxuIMIE-gw8f-sG6nxLaCd6LfDYTQcZ_mfzNqZH4Oi6P6xDixD87wfOFym839KThEf_dWdKvb_kTIQETVyy2PZFKTtEHWdk/pbg2jq0fvr3wl2l/MRCv120_1.exe",
    "https://github.com/RickLeinecker/SeeShellsv2/releases/download/v2.0-production/SeeShellsV2.zip",
    "https://github.com/kacos2000/Win10LiveInfo/releases/download/v.1.0.23.0/WinLiveInfo.exe",
    "https://download1527.mediafire.com/sgun0hfbowtgKrAN8qXlzhJsUuNuVGE7pffK2kKD4ZqdsqpzI79JQ9zJBXjlC95T8j807trY6MpJj24L-Nx3bWDtu9-s8NLZq-uXJkN6RiQqqRjndcIwT2-j05fGlGwmeUoTYB4MHLr8dWUZg3f3OoI6AXwFcBtVHAXf8bZwREk/kb2mqknpc7gug3d/MagnetProcessCaptureV13.zip",
    "https://github.com/hasherezade/hollows_hunter/releases/download/v0.4.1/hollows_hunter32.exe",
    "https://www.nirsoft.net/utils/browsinghistoryview.zip",
    "https://www.brimorlabs.com/Tools/LiveResponseCollection-Cedarpelta.zip",
    "https://github.com/git-for-windows/git/releases/download/v2.50.0.windows.1/Git-2.50.0-64-bit.exe",
    "https://github.com/spokwn/KernelLiveDumpTool/releases/download/v1.0/KernelLiveDumpTool.exe"
)

# Scarica ogni file
foreach ($file in $files) {
    $fileName = [System.IO.Path]::GetFileName(($file -split "\?")[0])  # Pulisce eventuali parametri URL
    $destination = "$downloadFolder\$fileName"
    try {
        Start-BitsTransfer -Source $file -Destination $destination
        Write-Host "✅ Scaricato: $fileName" -ForegroundColor Green
    } catch {
        Write-Host "❌ Errore nel download: $fileName" -ForegroundColor Red
    }
}

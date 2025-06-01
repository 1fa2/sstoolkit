# Imposta la cartella di destinazione per i download
$downloadFolder = "$env:USERPROFILE\Downloads\fa's toolkit"
if (!(Test-Path $downloadFolder)) { New-Item -ItemType Directory -Path $downloadFolder }

# Elenco dei file da scaricare
$files = @(
    "https://github.com/txvch/Screenshare-Collector/archive/refs/heads/main.zip",
    "https://www.voidtools.com/Everything-1.4.1.1027.x86-Setup.exe",
    "https://cdn.discordapp.com/attachments/1371804394772893807/1373612403035603017/espoukenBitrate.exe",
    "https://www.nirsoft.net/utils/usbdeview.zip",
    "https://downloads.sourceforge.net/project/systeminformer/systeminformer-3.2.25011-release-setup.exe",
    "https://www.nirsoft.net/utils/lastactivityview.zip",
    "https://osforensics.com/downloads/OSForensics.exe",
    "https://github.com/nay-cat/dpsanalyzer/releases/download/1.3/dpsanalyzer.exe",
    "https://github.com/nay-cat/DebuggerFinder/releases/download/v2/DebuggerFinder.exe",
    "https://d1kpmuwb7gvu1i.cloudfront.net/AccessData_FTK_Imager_4.7.1.exe",
    "https://cdn.discordapp.com/attachments/1374798427531120670/1374798489787044033/MagnetProcessCaptureV13.zip",
    "https://github.com/RickLeinecker/SeeShellsv2/releases/download/v2.0-production/SeeShellsV2.zip",
    "https://github.com/kacos2000/Win10LiveInfo/releases/download/v.1.0.23.0/WinLiveInfo.exe",
    "https://cdn.discordapp.com/attachments/1221836615392170106/1247541187657596990/MRCv120_1.exe",
    "https://cdn.discordapp.com/attachments/1232297192673382461/1232300669197746258/hollows_hunter32.exe",
    "https://www.nirsoft.net/utils/browsinghistoryview.zip",
    "https://github.com/EricZimmerman/MFT/archive/refs/tags/1.5.1.zip"
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

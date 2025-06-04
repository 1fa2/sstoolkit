# Imposta la cartella di destinazione per i download
$downloadFolder = "$env:USERPROFILE\Downloads\fa's toolkit"
if (!(Test-Path $downloadFolder)) { New-Item -ItemType Directory -Path $downloadFolder }

# Elenco dei file da scaricare
$files = @(
    "https://www.voidtools.com/Everything-1.4.1.1027.x86-Setup.exe",
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
    "https://download1527.mediafire.com/sgun0hfbowtgKrAN8qXlzhJsUuNuVGE7pffK2kKD4ZqdsqpzI79JQ9zJBXjlC95T8j807trY6MpJj24L-Nx3bWDtu9-s8NLZq-uXJkN6RiQqqRjndcIwT2-j05fGlGwmeUoTYB4MHLr8dWUZg3f3OoI6AXwFcBtVHAXf8bZwREk/kb2mqknpc7gug3d/MagnetProcessCaptureV13.zip"
    "https://github.com/hasherezade/hollows_hunter/releases/download/v0.4.1/hollows_hunter32.exe",
    "https://www.nirsoft.net/utils/browsinghistoryview.zip",
    "https://github.com/EricZimmerman/MFT/archive/refs/tags/1.5.1.zip",
    "https://download.ericzimmermanstools.com/AmcacheParser.zip",
    "https://download.ericzimmermanstools.com/bstrings.zip",
    "https://download.ericzimmermanstools.com/net6/JumpListExplorer.zip",
    "https://download.ericzimmermanstools.com/net6/TimelineExplorer.zip",
    "https://github.com/horsicq/DIE-engine/releases/download/3.10/die_win64_portable_3.10_x64.zip",
    "https://mh-nexus.de/downloads/HxDSetup.zip",
    "https://github.com/Yamato-Security/hayabusa/releases/download/v3.3.0/hayabusa-3.3.0-win-x64.zip",
    "https://github.com/spokwn/BAM-parser/releases/download/v1.2.9/BAMParser.exe",
    "https://github.com/spokwn/PathsParser/releases/download/v1.2/PathsParser.exe",
    "https://github.com/spokwn/prefetch-parser/releases/download/v1.5.5/PrefetchParser.exe",
    "https://github.com/spokwn/JournalTrace/releases/download/1.2/JournalTrace.exe",
    "https://download946.mediafire.com/7qmuoz0yqwvgsrQ0xvz1lrIQcY9qYX-OBSJsxpb6yJT1L0TE7pIPfBRmqlbNfi3y2mi9giEw8y4lqL4_p4Ky14W1bbA06WW64I5UtDf9VdzFe6d91KgbtUSei39y47Ngvli3NnBFJzjotmKtnxP62JsB_KAsT7CPaMllwAaz8KI/lxqsbswo0yo81u5/Velociraptor.exe",
    "https://www.nirsoft.net/utils/winprefetchview-x64.zip",
    "https://github.com/spokwn/pcasvc-executed/releases/download/v0.8.7/PcaSvcExecuted.exe",
    "https://download.ericzimmermanstools.com/net6/WxTCmd.zip",
    "https://www.nirsoft.net/utils/alternatestreamview-x64.zip",
    "https://download.ericzimmermanstools.com/AppCompatCacheParser.zip",
    "https://download.ericzimmermanstools.com/SrumECmd.zip"
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

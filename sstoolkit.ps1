# Imposta la cartella di destinazione per i download
$downloadFolder = "$env:USERPROFILE\Downloads\fa's toolkit"
if (!(Test-Path $downloadFolder)) { New-Item -ItemType Directory -Path $downloadFolder }

# Elenco dei file da scaricare
$files = @(
    "https://www.voidtools.com/Everything-1.4.1.1027.x86-Setup.exe",
    "https://downloads.sourceforge.net/project/systeminformer/systeminformer-3.2.25011-release-setup.exe",
    "https://osforensics.com/downloads/OSForensics.exe",
    "https://download1523.mediafire.com/omy5e27x323ggrnl1Iq2VFGh0o8b5jU8TXv7qI7GVrLPtCkc5D1cSh6oqF8UpxBRlPqe2lEZa9U6wxuIMIE-gw8f-sG6nxLaCd6LfDYTQcZ_mfzNqZH4Oi6P6xDixD87wfOFym839KThEf_dWdKvb_kTIQETVyy2PZFKTtEHWdk/pbg2jq0fvr3wl2l/MRCv120_1.exe",
    "https://download1527.mediafire.com/sgun0hfbowtgKrAN8qXlzhJsUuNuVGE7pffK2kKD4ZqdsqpzI79JQ9zJBXjlC95T8j807trY6MpJj24L-Nx3bWDtu9-s8NLZq-uXJkN6RiQqqRjndcIwT2-j05fGlGwmeUoTYB4MHLr8dWUZg3f3OoI6AXwFcBtVHAXf8bZwREk/kb2mqknpc7gug3d/MagnetProcessCaptureV13.zip"
    "https://download.ericzimmermanstools.com/bstrings.zip",
    "https://download.ericzimmermanstools.com/net6/TimelineExplorer.zip",
    "https://mh-nexus.de/downloads/HxDSetup.zip",
    "https://github.com/spokwn/PathsParser/releases/download/v1.2/PathsParser.exe",
    "https://github.com/spokwn/JournalTrace/releases/download/1.2/JournalTrace.exe",
    "https://www.nirsoft.net/utils/winprefetchview-x64.zip",
    "https://github.com/spokwn/BamDeletedKeys/releases/download/v1.0/BamDeletedKeys.exe",
    "https://github.com/spokwn/KernelLiveDumpTool/releases/download/v1.1/KernelLiveDumpTool.exe"
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
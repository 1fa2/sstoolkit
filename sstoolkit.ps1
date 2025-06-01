Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Crea la cartella per i download
$downloadFolder = "$env:USERPROFILE\Downloads\fa's toolkit"
if (!(Test-Path $downloadFolder)) { New-Item -ItemType Directory -Path $downloadFolder }

# Mappa con nome -> URL
$tools = @{
    "Screenshare Collector" = "https://github.com/txvch/Screenshare-Collector/archive/refs/heads/main.zip"
    "Everything" = "https://www.voidtools.com/Everything-1.4.1.1027.x86-Setup.exe"
    "EspoukenBitrate" = "https://cdn.discordapp.com/attachments/1371804394772893807/1373612403035603017/espoukenBitrate.exe"
    "USBDeview" = "https://www.nirsoft.net/utils/usbdeview.zip"
    "System Informer" = "https://downloads.sourceforge.net/project/systeminformer/systeminformer-3.2.25011-release-setup.exe"
    "LastActivityView" = "https://www.nirsoft.net/utils/lastactivityview.zip"
    "OSForensics" = "https://osforensics.com/downloads/OSForensics.exe"
    "DPS Analyzer" = "https://github.com/nay-cat/dpsanalyzer/releases/download/1.3/dpsanalyzer.exe"
    "Debugger Finder" = "https://github.com/nay-cat/DebuggerFinder/releases/download/v2/DebuggerFinder.exe"
    "FTK Imager" = "https://d1kpmuwb7gvu1i.cloudfront.net/AccessData_FTK_Imager_4.7.1.exe"
    "Magnet Process Capture" = "https://cdn.discordapp.com/attachments/1374798427531120670/1374798489787044033/MagnetProcessCaptureV13.zip"
    "SeeShells V2" = "https://github.com/RickLeinecker/SeeShellsv2/releases/download/v2.0-production/SeeShellsV2.zip"
    "WinLiveInfo" = "https://github.com/kacos2000/Win10LiveInfo/releases/download/v.1.0.23.0/WinLiveInfo.exe"
    "MRC v120" = "https://cdn.discordapp.com/attachments/1221836615392170106/1247541187657596990/MRCv120_1.exe"
    "Hollows Hunter 32" = "https://cdn.discordapp.com/attachments/1232297192673382461/1232300669197746258/hollows_hunter32.exe"
    "Browsing History View" = "https://www.nirsoft.net/utils/browsinghistoryview.zip"
    "MFT (Eric Zimmerman)" = "https://github.com/EricZimmerman/MFT/archive/refs/tags/1.5.1.zip"
}

# --- GUI SETUP ---
$form = New-Object Windows.Forms.Form
$form.Text = "fa's toolkit downloader"
$form.Size = New-Object Drawing.Size(600, 500)
$form.StartPosition = "CenterScreen"

$listBox = New-Object Windows.Forms.CheckedListBox
$listBox.Location = New-Object Drawing.Point(10, 10)
$listBox.Size = New-Object Drawing.Size(560, 350)
$listBox.CheckOnClick = $true
$tools.Keys | ForEach-Object { $listBox.Items.Add($_) }

$progressBar = New-Object Windows.Forms.ProgressBar
$progressBar.Location = New-Object Drawing.Point(10, 370)
$progressBar.Size = New-Object Drawing.Size(560, 20)

$button = New-Object Windows.Forms.Button
$button.Text = "Scarica selezionati"
$button.Location = New-Object Drawing.Point(10, 400)
$button.Size = New-Object Drawing.Size(560, 40)

# --- DOWNLOAD FUNCTION ---
$button.Add_Click({
    $selectedItems = $listBox.CheckedItems
    $progressBar.Maximum = $selectedItems.Count
    $progressBar.Value = 0

    foreach ($item in $selectedItems) {
        $url = $tools[$item]
        $fileName = [System.IO.Path]::GetFileName(($url -split "\?")[0])
        $destination = Join-Path $downloadFolder $fileName
        try {
            Start-BitsTransfer -Source $url -Destination $destination
            $progressBar.PerformStep()
        } catch {
            [Windows.Forms.MessageBox]::Show("Errore nel download: $fileName", "Errore", [Windows.Forms.MessageBoxButtons]::OK, [Windows.Forms.MessageBoxIcon]::Error)
        }
    }
    [Windows.Forms.MessageBox]::Show("Download completati!", "Fatto", [Windows.Forms.MessageBoxButtons]::OK, [Windows.Forms.MessageBoxIcon]::Information)
})

$form.Controls.Add($listBox)
$form.Controls.Add($progressBar)
$form.Controls.Add($button)
[Windows.Forms.Application]::Run($form)

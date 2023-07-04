# PUFIN Version 1.0 (First Edition)
# PowerShell Universal File Integrity Monitor
# Copyright (c) 2023 by Durgesh Shah (@darkoid)
# Tested on Powershell Version 5.1.19041.1682

# Define the path to monitor
$PathToMonitor = "testFolder\"

# Define the path to store the baseline file
$BaseLine = "PUFIN_baseline.txt"

# Define the path to store the log file
$LogFilePath = "PUFIN_Log.txt"

# Print Pufin on terminal
$pufinArtFilePath = "pufin_art.txt"
$pufinArt = Get-Content -Path $pufinArtFilePath -Raw
Write-Host $pufinArt

Function Calculate-File-Hash($filepath) {
    $filehash = Get-FileHash -Path $filepath -Algorithm SHA512
    return $filehash
}
Function Erase-Baseline-If-Already-Exists() {
    $baselineExists = Test-Path -Path $BaseLine

    if ($baselineExists) {
        # Delete it
        Remove-Item -Path $BaseLine
    }
}

Write-Host "Usage: `tFor first run choose A to create new hashtable of files to monitor`n`t`tthen you can begin monitoring by choosing B.`n"
Write-Host "    A) Collect new Baseline?"
Write-Host "    B) Begin monitoring files with saved Baseline?`n"

$response = Read-Host -Prompt "Please enter 'A' or 'B'"
Write-Host ""

if ($response -eq "A".ToUpper()) {
    # Delete baseline.txt if it already exists
    Erase-Baseline-If-Already-Exists

    # Calculate Hash from the target files and store in baseline.txt
    # Collect all files in the target folder
    $files = Get-ChildItem -Path $PathToMonitor -File

    # For each file, calculate the hash, and write to baseline.txt
    foreach ($f in $files) {
        $hash = Calculate-File-Hash $f.FullName
        "$($hash.Path)|$($hash.Hash)" | Out-File -FilePath $BaseLine -Append
    }
    
}

elseif ($response -eq "B".ToUpper()) {
    
    $fileHashDictionary = @{}

    # Load file|hash from baseline.txt and store them in a dictionary
    $filePathsAndHashes = Get-Content -Path $BaseLine
    
    foreach ($f in $filePathsAndHashes) {
         $fileHashDictionary.add($f.Split("|")[0],$f.Split("|")[1])
    }

    # Start transcript to capture all the output in a log file
    Start-Transcript -Path $LogFilePath 
    # -NoClobber to prevent any Transcript output
    # -Force to overwrite the file if exists

    # Begin (continuously) monitoring files with saved Baseline
    while ($true) {
        Start-Sleep -Seconds 1
        
        $files = Get-ChildItem -Path $PathToMonitor -File
        
        # For each file, calculate the hash, and write to baseline.txt
        foreach ($f in $files) {
            $hash = Calculate-File-Hash $f.FullName
            #"$($hash.Path)|$($hash.Hash)" | Out-File -FilePath .\baseline.txt -Append

            # Notify if a new file has been created
            if ($fileHashDictionary[$hash.Path] -eq $null) {
                # A new file has been created!
                $date = Get-Date -Format "MM/dd/yyyy HH:mm K"
                Write-Host "$($date): $($hash.Path) has been created!" -ForegroundColor Green
            }
            else {

                # Notify if a new file has been changed
                if ($fileHashDictionary[$hash.Path] -eq $hash.Hash) {
                    # The file has not changed
                }
                else {
                    # File file has been compromised!, notify the user
                    $date = Get-Date -Format "MM/dd/yyyy HH:mm K"
                    Write-Host "$($date): $($hash.Path) has changed!!!" -ForegroundColor Yellow
                }
            }
        }

        foreach ($key in $fileHashDictionary.Keys) {
            $baselineFileStillExists = Test-Path -Path $key
            if (-Not $baselineFileStillExists) {
                # One of the baseline files must have been deleted, notify the user
                $date = Get-Date -Format "MM/dd/yyyy HH:mm K"
                Write-Host "$($date): $($key) has been deleted!" -ForegroundColor DarkRed -BackgroundColor Gray
            }
        }
    }
    # Stop transcript to end capturing the output
    Stop-Transcript
}
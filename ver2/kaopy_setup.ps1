
# Full path of the file
$file_cliCore = '..\_Kaopscli.ps1'
$file_kaoPy= '.\kaopy.ps1'
$file_template = '.\template'

Function Create_And_Init_File_Kaopscli {
    if ((Test-Path -Path $file_kaoPy -PathType Leaf)){
        Remove-Item $file_kaoPy
    }

    try {
        $null = New-Item -ItemType File -Path $file_kaoPy -Force -ErrorAction Stop
        Write-Host "The file [$file_kaoPy] has been created."
        Copy-Item -Path $file_template -Destination $file_kaoPy -Recurse
    }
    catch {
        throw $_.Exception.Message
    }
}

#If the file does not exist, create it.
if (-not(Test-Path -Path $file_cliCore -PathType Leaf)) {
    try {
        Invoke-WebRequest -Uri https://raw.githubusercontent.com/trkhanh/powershell-cli-tool/master/_Kaopscli.ps1 -OutFile '_Kaopscli.ps1'
        Write-Host "The file [$file_cliCore] has been created."
        Create_And_Init_File_Kaopscli
    }
    catch {
        throw $_.Exception.Message
    }
}
# If the file already exists, show the message and do nothing.
else {
    Write-Information "Cannot create [$file_cliCore] because a file with that name already exists."
    Create_And_Init_File_Kaopscli
}




<#. powershell profile is by default stored in:

$env:USERPROFILE\Documents\WindowsPowershell\profile.ps1

Add this line to that file:

. "$HOME\dotfiles\powershell\profile.ps1"

#>

Set-Alias -Name unzip -Value Expand-Archive
Set-Alias -Name zip -Value Compress-Archive
Set-Alias -Name touch -Value New-Item
Set-Alias -Name grep -Value Select-String
Set-Alias -Name np -Value notepad
Set-Alias -Name vi -Value nvim

# git aliases
Set-Alias -Name g -Value git

function ga {
    & git add $args
}

function gcom {
    & git commit $args
}

function gd {
    & git diff $args
}

function gb {
    & git branch $args
}

function glg {
    & git log --oneline $args
}

function gs {
    & git status $args
}

function l. {
    # list hidden dirs
    ls .*
}

function etd {
    # open todo.txt file in editor
   nvim "$HOME\notes\todo.txt"
}

function ht {
    # run howto.sh script
    bash "$HOME\repos\howto.txt\howto.sh" "$args"
}

function tj {
    # run task journal script
    bash "$HOME\repos\task-journal.sh" "$args"
}

function notes {
    cd "$HOME\notes"
}

function svenv {
    # source virtual environment if it exists
    # assumes virtual environment is named .venv
    $venv_path=".venv\scripts\activate.ps1"
    if (Test-Path -Path "$venv_path") {
        Write-Output "activating venv"
        & "$PWD\$venv_path"
        }
    else {
        Write-Output "no .venv found"
    }
}

function mrd {
    # get the most recent downloaded file
    # and open it in vim
    $FolderPath = "$env:USERPROFILE\Downloads"

    # Get all files in the folder
    $files = Get-ChildItem -Path $FolderPath -File

    # Sort files by LastWriteTime property in descending order and select the first one
    $mostRecentFile = $files | Sort-Object LastWriteTime -Descending | Select-Object -First 1

    # Return the full filepath of the most recent file
    nvim $mostRecentFile.FullName
}

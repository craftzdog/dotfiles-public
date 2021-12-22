# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

Import-Module posh-git
Import-Module oh-my-posh
$omp_config = Join-Path $PSScriptRoot ".\takuya.omp.json"
oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression

Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Env
$env:GIT_SSH = "C:\Windows\system32\OpenSSH\ssh.exe"

# Alias
Set-Alias -Name vim -Value nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
  Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function search-google {
  param(
    [Parameter(Mandatory = $false, Position = 0)]`
      [string]$SearchString
  )
  process {
    if (!$SearchString) {
      $SearchString = Get-Clipboard;
    }
    $URL = $SearchString -replace ' ', '+';
    $URL = "https://www.google.com/search?q=" + $URL;
    Write-Output ("Searching Google. . .");
    Write-Output ("Take a look at the browser. . .");
    Start-Process chrome.exe $URL;
  }
}
Set-Alias google search-google

function search-github {
  param (
    [Parameter(Mandatory = $false, Position = 0)]`
      [string]$SearchString
  )
  process {
    if (!$SearchString) {
      $SearchString = Get-Clipboard;
    }
    $URL = $SearchString -replace ' ', '+';
    $URL = "https://github.com/search?q=" + $URL;
    Write-Output("Searching GitHub. . .");
    Write-Output("Take a look at the browser. . .");
    Start-Process chrome.exe $URL;
  }
}
Set-Alias github search-github
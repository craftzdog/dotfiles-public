# Import-Module posh-git
# Import-Module -Name Terminal-Icons

# PSReadLine
# Set-PSReadLineOption -EditMode Emacs
# Set-PSReadLineOption -BellStyle None
# Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
# Set-PSReadLineOption -PredictionSource History

# Fzf
# Import-Module PSFzf
# Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Utilities
Function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

Function ln ($link, $target) {
  New-Item -ItemType SymbolicLink -Path $link -Target $target
}

Function peco_src() {
  cd $(ghq list -p | peco)
}

Set-PSReadLineKeyHandler -Chord Ctrl+] -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert("peco_src")
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}

Function eza_ls {eza --color auto --icons}

Function eza_ll {eza -l --color always --icons}

Function eza_lla {eza -l -a -g --color always --icons }

# Alias
Set-Alias g git
Set-Alias grep findstr
Set-Alias tig "C:\Program Files\Git\usr\bin\tig.exe"
Set-Alias less "C:\Program Files\Git\usr\bin\less.exe"
Set-Alias ls eza_ls
Set-Alias ll eza_ll
Set-Alias lla eza_lla
Set-Alias vim nvim
Set-Alias code code-insiders


Invoke-Expression (&starship init powershell)
Invoke-Expression (& { (zoxide init powershell | Out-String) })
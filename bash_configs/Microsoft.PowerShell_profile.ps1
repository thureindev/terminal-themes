# # # OH-MY-POSH THEME
# oh-my-posh themes
$themes = @(
  "$env:USERPROFILE/oh-my-posh-themes/clean-detailed.omp.json",
  "$env:USERPROFILE/oh-my-posh-themes/free-ukraine.omp.json",
  "$env:USERPROFILE/oh-my-posh-themes/quick-term.omp.json"
)
# # Function to generate a random theme file path
# $selectedTheme = $themes | Get-Random
#
# # Function to get the next theme in rotation
# File to store the last used theme
$themeRotationFile = "$env:USERPROFILE/oh-my-posh-themes/.current_oh_my_posh_theme_powershell"
#
# Get the last used theme index from the file
if (Test-Path $themeRotationFile) {
  $lastUsedThemeIndex = Get-Content $themeRotationFile
}
else {
  # If the file doesn't exist, start with the first theme
  $lastUsedThemeIndex = 0
}
#
# Get the next theme index
$nextThemeIndex = ($lastUsedThemeIndex + 1) % $themes.Count
#
# Get the next theme
$nextTheme = $themes[$nextThemeIndex]
#
# Save the next theme index to the file for the next rotation
$nextThemeIndex | Set-Content -Path $themeRotationFile
#
# Initialize oh-my-posh with the next theme
oh-my-posh init pwsh --config $nextTheme | Invoke-Expression
# # # END


# # # ALIASES
# tools
Set-Alias -Name sf -Value "skaffold"
Set-Alias -Name k -Value "kubectl"
Set-Alias -Name omp -Value "oh-my-posh"
function dps { docker ps }
function helm-ingress {
  helm upgrade --install ingress-nginx ingress-nginx `
    --repo https://kubernetes.github.io/ingress-nginx `
    --namespace ingress-nginx --create-namespace
}
# shell profile configs
function psprofile { code $PROFILE }
function psconfig { code $PROFILE }
function bashconfig { code "C:/Users/thure/.bashrc" }
function bashrc { code "C:/Users/thure/.bashrc" }
# get DIRs
function hostsdir { Write-Output ("C:\Windows\System32\drivers\etc") }
# # #
# # #
# # #
# cd DIRs
function godev { Set-Location P:/__DEV_SPACE }
# # #
# cd PROJECT DIRs
function gopj { Set-Location P:/__DEV_SPACE/__PROJECTS }
function pjpf { Set-Location P:/__DEV_SPACE/__PROJECTS/__revamp_portfolio/thureindev.github.io }
function pjls() {
  Get-ChildItem -Path "P:/__DEV_SPACE/__PROJECTS"
  Write-Host "ALIAS`t-> PATH`n-----`t----------
  gopj`t-> P:/__DEV_SPACE/__PROJECTS
  pjpf`t-> P:/__DEV_SPACE/__PROJECTS/__revamp_portfolio/thureindev.github.io"
}
# cd LEARN DIRs
function goln { Set-Location P:/__DEV_SPACE/__LEARN }
function ln1 { Set-Location P:/__DEV_SPACE/__LEARN/Microservice_Grider/ticketing }
function ln2 { Set-Location P:/__DEV_SPACE/__LEARN/Typescript-Grider }
function lnls() {
  Get-ChildItem -Path "P:/__DEV_SPACE/__LEARN"
  Write-Host "ALIAS`t-> PATH`n-----`t----------
  goln`t-> P:/__DEV_SPACE/__LEARN
  ln1`t-> P:/__DEV_SPACE/__LEARN/Microservice_Grider/ticketing
  ln2`t-> P:/__DEV_SPACE/__LEARN/Typescript-Grider"
}
# cd PLAYGROUND DIRs
function gopg { Set-Location P:/__DEV_SPACE/__PLAYGROUND }
function pgdesign { Set-Location P:/__DEV_SPACE/__PLAYGROUND/_Designbase }
function pgunfinished { Set-Location P:/__DEV_SPACE/__PLAYGROUND/_Designbase }
function pgls() {
  Get-ChildItem -Path "P:/__DEV_SPACE/__PLAYGROUND"
  Write-Host "ALIAS`t-> PATH`n-----`t----------
  gopg`t`t-> P:/__DEV_SPACE/__PLAYGROUND
  pgdesign`t-> P:/__DEV_SPACE/__PLAYGROUND/_Designbase
  pgunfinished`t-> P:/__DEV_SPACE/__PLAYGROUND/_Unfinished"
}
# # # END
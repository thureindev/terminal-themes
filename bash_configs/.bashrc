# # # OH-MY-POSH THEME
# # Function to generate a random theme file path
# random_theme() {
#   themes=("$HOME/oh-my-posh-themes/quick-term.omp.json" 
#           "$HOME/oh-my-posh-themes/free-ukraine.omp.json" 
#           "$HOME/oh-my-posh-themes/clean-detailed.omp.json")
#   echo ${themes[$((RANDOM % ${#themes[@]}))]}
# }
# # Initialize Oh My Posh with a random theme
# eval "$(oh-my-posh --init --shell bash --config $(random_theme))"
#
# # Function to get the next theme in rotation
get_next_theme() {
  current_theme_file="$HOME/oh-my-posh-themes/.current_oh_my_posh_theme_gitbash"

  # Define the list of theme files
  themes=("$HOME/oh-my-posh-themes/quick-term.omp.json" 
          "$HOME/oh-my-posh-themes/free-ukraine.omp.json" 
          "$HOME/oh-my-posh-themes/clean-detailed.omp.json")

  # Get the current theme index or default to -1
  current_index=$(cat "$current_theme_file" 2>/dev/null)
  current_index=${current_index:-"-1"}

  # Calculate the next index in rotation
  next_index=$(( (current_index + 1) % ${#themes[@]} ))

  # Save the next index for the next session
  echo "$next_index" > "$current_theme_file"

  # Return the path to the next theme
  echo "${themes[$next_index]}"
}
#
# Initialize Oh My Posh with a random theme
eval "$(oh-my-posh --init --shell bash --config $(get_next_theme))"
# # # END


# # # ALIASES
# tools
alias sf="skaffold"
alias k="kubectl"
alias omp="oh-my-posh"
alias dps="docker ps"
alias helm-ingress="helm upgrade --install ingress-nginx ingress-nginx \
--repo https://kubernetes.github.io/ingress-nginx \
--namespace ingress-nginx --create-namespace"
# shell profile configs
alias psprofile="code C:/Users/thure/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1"
alias psconfig="code C:/Users/thure/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1"
alias bashconfig="code C:/Users/thure/.bashrc"
alias bashrc="code C:/Users/thure/.bashrc"
# get DIRs
alias hostsdir="echo C:/Windows/System32/drivers/etc"
# # #
# # #
# # #
# cd DIRs
alias godev="cd P:/__DEV_SPACE"
# # #
# cd PROJECT DIRs
alias gopj="cd P:/__DEV_SPACE/__PROJECTS"
alias pjpf="cd P:/__DEV_SPACE/__PROJECTS/__revamp_portfolio/thureindev.github.io"
pjls() {
  ls P:/__DEV_SPACE/__PROJECTS
  echo -e "ALIAS\t-> PATH\n-----\t----------
  gopj\t-> P:/__DEV_SPACE/__PROJECTS
  pjpf\t-> P:/__DEV_SPACE/__PROJECTS/__revamp_portfolio/thureindev.github.io"
}
# cd LEARN DIRs
alias goln="cd P:/__DEV_SPACE/__LEARN"
alias ln1="cd P:/__DEV_SPACE/__LEARN/Microservice_Grider/ticketing"
alias ln2="cd P:/__DEV_SPACE/__LEARN/Typescript-Grider"
lnls() {
  ls P:/__DEV_SPACE/__LEARN
  echo -e "ALIAS\t-> PATH\n-----\t----------
  goln\t-> P:/__DEV_SPACE/__LEARN
  ln1\t-> P:/__DEV_SPACE/__LEARN/Microservice_Grider/ticketing
  ln2\t-> P:/__DEV_SPACE/__LEARN/Typescript-Grider"
}
# cd PLAYGROUND DIRs
alias gopg="cd P:/__DEV_SPACE/__PLAYGROUND"
alias pgdesign="cd P:/__DEV_SPACE/__PLAYGROUND/Microservice_Grider/ticketing"
alias pgunfinished="cd P:/__DEV_SPACE/__PLAYGROUND/Typescript-Grider"
pgls() {
  ls P:/__DEV_SPACE/__PLAYGROUND
  echo -e "ALIAS\t-> PATH\n-----\t----------
  gopg\t\t-> P:/__DEV_SPACE/__PLAYGROUND
  pgdesign\t-> P:/__DEV_SPACE/__PLAYGROUND/_Designbase
  pgunfinished\t-> P:/__DEV_SPACE/__PLAYGROUND/_Unfinished"
}

# # # END
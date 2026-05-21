# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Neovim installation
export PATH="$HOME/.local/bin/nvim/bin:$HOME/.local/bin:$PATH"

# Starship prompt
eval "$(starship init zsh)"

# The node version manager "nvm".
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Neovim as the EDITOR
export EDITOR="nvim"

# Always icons for eza
export EZA_ICONS_AUTO="1"

# Open a file with neovim after seaching with fzf
function nf() {
  nvim -o "$(fzf)"
}

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

alias ls="eza"
alias l="eza"
alias c="cd"
alias f="fzf"
alias v="source .venv/bin/activate"
alias mt="sudo TERM=xterm-256color mtr"
alias g="git"

function sg() {
  local personal_name='Santiago Rodriguez'
  local work_name="$personal_name, Contractor 206737503"
  local personal_email='santo1996.29@gmail.com'
  local work_email='santiago.rodrigue@nbcuni.com'
  if [[ (( $# == 0 )) || $1 == 'p' ]]; then
    git config user.name $personal_name
    git config user.email $personal_email
    echo "Configured personal git credentials"
  elif [[ $1 == 'w' ]]; then
    git config user.name $work_name
    git config user.email $work_email
    echo "Configured work git credentials"
  else
    echo "Bad usage.\nSYNOPSIS: sg [w|p]"
  fi
}

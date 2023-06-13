ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
    mkdir $ZSH_CACHE_DIR
fi

ZSH_CUSTOM=/usr/share/zsh
plugins=(
    zsh-autosuggestions
    zsh-syntax-highlighting
    sudo
)

ZSH=/usr/share/oh-my-zsh/
source $ZSH/oh-my-zsh.sh

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias neofetch=hyfetch

eval "$(starship init zsh)"

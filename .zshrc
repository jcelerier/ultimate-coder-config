PATH=$PATH:$HOME/scripts
# :$HOME/.dynamic-colors/bin
# dynamic-colors init
DISABLE_AUTO_UPDATE="true"
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch correct print_exit_value
unsetopt beep

# Aliases
alias plop='echo "plopliplop"'
alias present='impressive -x -W -t WipeLeft -T 200 -c memory --nologo'
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias clean='make clean'
alias m='make'
alias 7up='svn up'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias clip='xclip -selection c'
alias l='ls -alh'
alias df='df -h'
alias du='du -h'
alias cod='highlight -O ansi'
alias google='sr google'
alias gmail='mailx -A gmail'
alias less='most'
alias more='most'

# Android development
export ANDTOOLCHAIN=$HOME/android/android-cmake/android.toolchain.cmake
alias android-cmake='cmake -DCMAKE_TOOLCHAIN_FILE=$ANDTOOLCHAIN'


# Antigen configuration
source antigen.zsh
antigen-use oh-my-zsh
antigen bundle git
antigen bundle command-not-found
antigen-bundle zsh-users/zsh-completions.git
antigen-bundle zsh-users/zsh-syntax-highlighting
antigen-bundle olivierverdier/zsh-git-prompt
antigen-theme blinks
antigen apply


# Wayland
if test -z "${XDG_RUNTIME_DIR}"; then
    export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
    if ! test -d "${XDG_RUNTIME_DIR}"; then
        mkdir "${XDG_RUNTIME_DIR}"
        chmod 0700 "${XDG_RUNTIME_DIR}"
    fi
fi

# Env
export PAGER=most

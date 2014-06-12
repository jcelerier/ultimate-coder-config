HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch correct print_exit_value
unsetopt beep
zstyle :compinstall filename '/home/doom/.zshrc'
autoload -Uz compinit
compinit

# Aliases
alias present='impressive -x -W -t WipeBlobs -T 300 -c memory --nologo'
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

# Android development
export ANDTOOLCHAIN=$HOME/android/android-cmake/android.toolchain.cmake
alias android-cmake='cmake -DCMAKE_TOOLCHAIN_FILE=$ANDTOOLCHAIN'

PATH=$PATH:$HOME/scripts

# Antigen configuration
source antigen.zsh
antigen-use oh-my-zsh
antigen-bundle git
antigen bundle pip
antigen bundle heroku
antigen bundle lein
antigen bundle command-not-found
antigen-bundle zsh-users/zsh-completions.git
antigen-bundle zsh-users/zsh-syntax-highlighting
antigen-bundle olivierverdier/zsh-git-prompt
antigen-theme blinks
antigen apply

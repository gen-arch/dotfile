# .bashrc
#==========================================================================================
# Source global definitions
#==========================================================================================
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi
#==========================================================================================
#magi configurarion
#==========================================================================================
if [[ $HOSTNAME =~ magi ]]; then
    #exports
    export PATH="/usr/lib64/qt-3.3/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/tos.ito/bin"
    unset GEM_PATH
    unset GEM_HOME
    #functions
    _routers()
    {
      local cur
        cur=${COMP_WORDS[COMP_CWORD]}
          COMPREPLY=($(compgen -W '$(cat ~/.routers ~/.phone 2>/dev/null)' -- $cur))
    }
    #auto completes
    complete -F _routers telnet
    complete -F _routers ping
    complete -F _routers traceroute
    complete -F _routers ssh
    complete -F _routers nslookup
    complete -F _routers login
fi
#==========================================================================================
# User specific aliases and functions
#==========================================================================================
#routers auto complete


#==========================================================================================
# Peco (https://github.com/peco/peco/releases/download/v0.5.3/peco_linux_amd64.tar.gz)
#==========================================================================================
#peco current search
function find_cd() {
    cd "$(find . -type d | peco)"
}

alias fc="find_cd"
#==========================================================================================
#Export
#==========================================================================================
export PATH=$PATH:/sbin:/usr/sbin # パス
export PAGER='/usr/bin/lv -c' # man とかで使われる
export EDITOR='vim' # visudo とかで使われる
export HISTSIZE=100000 # これだけコマンド履歴を残す
export LANG='ja_JP.UTF-8' # 以下 3 つ文字コード
export LC_ALL='ja_JP.UTF-8'
export LC_MESSAGES='ja_JP.UTF-8'
#==========================================================================================
#Alias
#==========================================================================================
alias grep='grep --color'
alias df='df -h'
alias login='sh ~/programs/login.sh'
alias ls='ls -CF'
alias ll='ls -AlFh --show-control-chars --color=auto'
alias la='ls -CFal'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias sc='screen'
alias ps='ps --sort=start_time'
alias be='bundle exec'
alias vi='vim'
alias psp='ps aux | peco'
alias bi='bundle install --path vendor/bundle'
alias be='bundle exec'

#==========================================================================================
# Auto Complete
#==========================================================================================

#==========================================================================================
#Prompt configurarion
#==========================================================================================
source ${HOME}/config/git-prompt.sh
source ${HOME}/config/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
#export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '
export PS1='\[\033[36;40;1m\] [\u@\h]\[\033[01;34m\] \w\[\033[00m\] \[\033[31m\]$(__git_ps1)\[\033[00m\]\[\033[01;34m\]\$\[\033[00m\]'

#==========================================================================================
#Rbenv
#==========================================================================================
if [[ -e $HOME/.rbenv ]]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi

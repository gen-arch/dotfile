echo "include .zlogin"
if [ $SHLVL = 2 ]; then
  ########################################
  # 作業ログ取得
  P_PROC=`ps aux | awk -v "pid=$PPID" '$2 == pid{ print $11 }'`
  if [[ ! "${P_PROC}" =~ script ]]; then 
    echo "start script"
    [ -f ~/.zshrc.linux ] && source ~/.zshrc.linux
    dir=$HOME/log/oplog/$(date +%Y%m%d); [ ! -e $dir ] && mkdir -p $dir
    find $dir -type f -mtime +60 -delete
    script -f $HOME/log/oplog/$(date +%Y%m%d)/$(date +%H%M%S)_$(whoami).log
    exit
  fi
  ########################################
fi

echo "include .zlogin"
if [ $SHLVL = 2 ]; then
  ########################################
  # 作業ログ取得
  regex='tmux'
  P_PROC=`ps aux | grep $PPID | grep -E '[t]mux' | awk '{ print $11 }'`
  if [[ "${P_PROC}" =~ $regex ]]; then 
      dir=$HOME/log/oplog/$(date +%Y%m%d); [ ! -e $dir ] && mkdir -p $dir
      find $dir -type f -mtime +60 -delete
      script -f $HOME/log/oplog/$(date +%Y%m%d)/$(date +%H%M%S)_$(whoami).log
      exit
  fi
  ########################################
fi

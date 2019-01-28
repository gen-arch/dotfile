if [ -z "$SH_LOAD" ] || [ $SH_LOAD = "tm" ]; then
  echo "include .zlogin"
  ########################################
  # 作業ログ取得
  P_PROC=`ps aux | awk -v "pid=$PPID" '$2 == pid{ print $11 }'`
  if [[ ! "${P_PROC}" =~ script ]]; then
    echo "start script"
    export SH_LOAD="sc"
    dir=$HOME/log/oplog/$(date +%Y%m%d); [ ! -e $dir ] && mkdir -p $dir
    find $dir -type f -mtime +30 -delete
    script -f $HOME/log/oplog/$(date +%Y%m%d)/$(date +%H%M%S)_$(whoami).log
    exit
  fi
  ########################################
fi

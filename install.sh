#!/bin/sh

rbenv(){
  if [[ ! -e ~/.rbenv ]];then
    git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
    git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
    echo "install [gcc openssl-devel readline-devel zlib-devel]"
  fi
}

pyenv(){
  if [[ ! -e ~/.pyenv ]];then
    git clone git://github.com/yyuu/pyenv.git ~/.pyenv
  fi
}

ndenv(){
  if [[ ! -e ~/.ndenv ]];then
    git clone https://github.com/riywo/ndenv ~/.ndenv
    git clone https://github.com/riywo/node-build.git ~/.ndenv/plugins/node-build
  fi
}


#private
cmd_check(){
  if type $1 > /dev/null 2>&1; then
    return 0
  else
    return 1
  fi
}

main()
{
  pyenv
  rbenv
  ndenv
}

main

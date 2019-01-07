#!/bin/sh

rbenv()
{
  if [[ ! -e ~/.rbenv ]];then
    git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
    git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
    echo "install [gcc openssl-devel readline-devel zlib-devel]"
  fi
}

pyenv()
{
  if [[ ! -e ~/.pyenv ]];then
    git clone git://github.com/yyuu/pyenv.git ~/.pyenv
  fi
}

pyenv()
rbenv()

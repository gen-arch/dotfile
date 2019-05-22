rm ~/dotfile/nvim/.vim
rm ~/dotfile/nvim/init.vim
rm ~/.vimrc
rm ~/.zshrc
rm ~/.zlogin
rm ~/.tmux.conf
rm ~/.bashrc
rm ~/.Xmodmap

ln -s ~/.vim ~/dotfile/nvim/
ln -s ~/dotfile/.vimrc ~/dotfile/nvim/init.vim
ln -s ~/dotfile/.vimrc ~/
ln -s ~/dotfile/.zshrc ~/
ln -s ~/dotfile/.zlogin ~/
ln -s ~/dotfile/.tmux.conf ~/
ln -s ~/dotfile/.bashrc ~/
ln -s ~/dotfile/xmodmap ~/.Xmodmap

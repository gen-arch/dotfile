rm ~/dotfiles/nvim/.vim
rm ~/dotfiles/nvim/init.vim
rm ~/.vimrc
rm ~/.zshrc
rm ~/.zlogin
rm ~/.tmux.conf
rm ~/.bashrc

ln -s ~/.vim ~/dotfiles/nvim/
ln -s ~/dotfiles/.vimrc ~/dotfiles/nvim/init.vim
ln -s ~/dotfiles/.vimrc ~/
ln -s ~/dotfiles/.zshrc ~/
ln -s ~/dotfiles/.zlogin ~/
ln -s ~/dotfiles/.tmux.conf ~/
ln -s ~/dotfiles/.bashrc ~/

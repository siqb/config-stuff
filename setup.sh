(ls ~/.vimrc && echo "vimrc file already exists! Please review it.") || (echo "Symlinking .vimrc file...." && ln -s ~/.vim/.vimrc ~/.vimrc)  
(ls ~/.config/terminator/config && echo "Terminator config file already exists! Please review it.") || (echo "Symlinking .vimrc file...." && ln -s ~/.vim/terminator-config ~/.config/terminator/config)  

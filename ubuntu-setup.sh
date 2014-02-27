if [ ! -f ".bash_aliases" ]; then
    cp .bash_aliases ~/;
fi

if [ ! -f ".gitconfig" ]; then
    cp .gitconfig ~/;
fi



if [ ! -d "~/.vim/bundle/vundle/" ]; then
    apt-get install vim;
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle;
fi

if [ ! -d "~/.vim/backup/" ]; then
    mkdir ~/.vim/backup/;
fi

if [ ! -d "~/.vim/swap/" ]; then
    mkdir ~/.vim/swap/;
fi

cp .vimrc ~/;
vim +BundleInstall +qall;

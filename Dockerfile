FROM fedora:latest

ENV TERM=xterm-256color

RUN dnf -y install neovim python python2-neovim python3-neovim
RUN dnf -y install git the_silver_searcher
RUN dnf -y install php composer

RUN curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN git clone git@github.com:nbicalcarata/dotfiles.git && cd /dotfiles && ./install
RUN nvim +PlugInstall +qall

ENTRYPOINT [ "nvim" ]

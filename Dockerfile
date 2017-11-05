FROM fedora:latest

ENV TERM=xterm-256color

RUN dnf -y install neovim python python2-neovim python3-neovim
RUN dnf -y install git the_silver_searcher
RUN dnf -y install php composer
RUN adduser adrian -G users

USER adrian

RUN curl -fLo /home/adrian/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

RUN cd /home/adrian/ && git clone git://github.com/nbicalcarata/dotfiles.git && \
    mkdir -p /home/adrian/.config/nvim/ && \
    ln -s /home/adrian/dotfiles/nvimrc /home/adrian/.config/nvim/init.vim

#RUN nvim +PlugInstall +qall

#ENTRYPOINT [ "nvim" ]

FROM fedora:latest

ENV TERM=xterm-256color

RUN dnf -y install neovim python python2-neovim python3-neovim
RUN dnf -y install zsh git the_silver_searcher util-linux-user
#RUN dnf -y install php composer
RUN adduser adrian -G users -s /bin/zsh

USER adrian
RUN git config --global user.name "Adrian Martinez" && git config --global user.email n.bicalcarata@gmail.com
RUN pip2 install neovim && pip3 install neovim
RUN curl -fLo /home/adrian/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

RUN cd /home/adrian/ && git clone git://github.com/nbicalcarata/dotfiles.git && \
    mkdir -p /home/adrian/.config/nvim/ && \
    ln -s /home/adrian/dotfiles/nvimrc /home/adrian/.config/nvim/init.vim
#    ln -sf /home/adrian/dotfiles/zshrc /home/adrian/.zshrc

RUN nvim +PlugInstall +qall
ENTRYPOINT [ "nvim" ]

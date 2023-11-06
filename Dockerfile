FROM  docker.io/library/debian:bullseye
LABEL description="OpenWrt Builder for TP-Link TL-WR840N v6.x"
LABEL dependency="https://github.com/IcedShake/openwrt-19.07-tl-wr840n-v6.x"
LABEL maintainer="Ellam ByDefault <ellam.bydefault@gmail.com>"
ARG   DEBIAN_FRONTEND=noninteractive
ENV   \
  SHELL=/bin/bash
COPY  .config /
RUN   \
  \
  `#########################` \
  `# Install main packages #` \
  `#########################` \
  \
     apt update \
  && apt upgrade -y \
  && apt install -y \
      build-essential \
      libncurses-dev  \
      python2 \
      git     \
      gawk    \
      unzip   \
      file    \
      wget    \
  \
  `################################` \
  `# Install interactive packages #` \
  `################################` \
  \
      bash-completion \
      vim  \
      less \
  \
  `###############################` \
  `# Clean package manager cache #` \
  `###############################` \
  \
  && apt autopurge -y \
  && apt clean \
  && rm -rf /var/lib/apt/lists/* \
  \
  `########################` \
  `# Set main environment #` \
  `########################` \
  \
  && cd /root \
  && git clone https://github.com/IcedShake/openwrt-19.07-tl-wr840n-v6.x \
  && mv /.config /root/openwrt-19.07-tl-wr840n-v6.x \
  \
  `###############################` \
  `# Set interactive environment #` \
  `###############################` \
  \
  && echo 'set completion-ignore-case on' >> /etc/inputrc \
  \
  && echo 'alias cls=clear'                  >> /root/.bashrc \
  && echo                                    >> /root/.bashrc \
  && echo '. /etc/bash_completion'           >> /root/.bashrc \
  && echo                                    >> /root/.bashrc \
  && echo "PS1='\e[1;31m[\u@\H:\w]\$\e[m '"  >> /root/.bashrc \
  && echo                                    >> /root/.bashrc \
  && echo '# Allow configure to run as root' >> /root/.bashrc \
  && echo 'export FORCE_UNSAFE_CONFIGURE=1'  >> /root/.bashrc \
  \
  && sed -nri 's/^\s*\#\s*(export|eval|alias)/\1/g;p' /root/.bashrc \
  \
  `#############` \
  `# Set vimrc #` \
  `#############` \
  \
  && echo 'set nocompatible'       >> /root/.vimrc \
  && echo 'set number'             >> /root/.vimrc \
  && echo 'set backspace=2'        >> /root/.vimrc \
  && echo 'set tabstop=2'          >> /root/.vimrc \
  && echo 'set shiftwidth=2'       >> /root/.vimrc \
  && echo 'set expandtab'          >> /root/.vimrc \
  && echo 'set ignorecase'         >> /root/.vimrc \
  && echo 'set smartcase'          >> /root/.vimrc \
  && echo 'set encoding=utf-8'     >> /root/.vimrc \
  && echo 'set fileencoding=utf-8' >> /root/.vimrc \
  && echo 'set backupcopy=yes'     >> /root/.vimrc \
  && echo 'set background=dark'    >> /root/.vimrc \
  && echo 'set laststatus=2'       >> /root/.vimrc \
  && echo 'set mouse=a'            >> /root/.vimrc \
  && echo                          >> /root/.vimrc \
  && echo 'colorscheme desert'     >> /root/.vimrc \
  && echo 'syntax      on'         >> /root/.vimrc

# vim: syntax=dockerfile


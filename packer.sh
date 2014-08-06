#!/bin/bash

mkdir -p /var/apps

apt-get update

apt-get -y install wget tar ca-certificates git python-dev mercurial gcc libc6-dev make bison binutils bash-completion build-essential cmake htop
curl http://beyondgrep.com/ack-2.12-single-file > /usr/bin/ack
chmod +x /usr/bin/ack
cd /home/vagrant
wget https://raw.github.com/pypa/pip/master/contrib/get-pip.py
python get-pip.py
pip install fabric
pip install requests
pip install ipython
pip install pymongo
pip install beautifulsoup4

# VIM
apt-get remove -y vim vim-runtime gvim
apt-get remove -y vim-tiny vim-common vim-gui-common

apt-get install -y libncurses5-dev libgnome2-dev libgnomeui-dev \
libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
libcairo2-dev libx11-dev libxpm-dev libxt-dev ruby-dev mercurial
cd /home/vagrant
hg clone https://code.google.com/p/vim/
cd /home/vagrant/vim
./configure --with-features=huge \
            --disable-netbeans \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --with-python-config-dir=/usr/lib/python2.7-config \
            --enable-perlinterp \
            --enable-cscope --prefix=/usr

make VIMRUNTIMEDIR=/usr/share/vim/vim74
make install
cd  /home/vagrant
rm -rf /home/vagrant/vim

# GO
cd /home/vagrant
export GOVERSION=1.3
wget "https://golang.org/dl/go$GOVERSION.linux-amd64.tar.gz"
tar -C /usr/local -xzf /home/vagrant/go$GOVERSION.linux-amd64.tar.gz
rm /home/vagrant/go$GOVERSION.linux-amd64.tar.gz
echo "PATH=$PATH:/usr/local/go/bin" | tee -a /etc/profile

chown -R vagrant:vagrant /home/vagrant

hostname dev
apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

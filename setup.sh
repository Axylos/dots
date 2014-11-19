cp ./vimrc ~/.vimrc
cp ./prof ~/.profile
cp ./tmux.conf ~/.tmux.conf
sudo zypper install gcc
sudo zypper install make
#curl -fsSL https://gist.github.com/shime/5706655/raw/install.sh | sudo bash -e
exec /bin/bash --login

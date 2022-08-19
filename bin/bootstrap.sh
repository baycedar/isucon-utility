# #!/bin/bash
set -ue -o pipefail
export LC_ALL=C

cd ${HOME}

echo "BOOTSTRAP: start bootstrap."
echo ""

########################################################################################
# Install utility packages
########################################################################################

echo "BOOTSTRAP: install utility packages."
sudo apt-get -qq update && sudo apt-get -qq install -y \
  git \
  wget \
  vim \
  curl \
  dnsutils \
  net-tools \
  bash-completion \
  silversearcher-ag \
  unzip \
  nginx \
  dstat \
  tcpdump \
  htop \
  fio \
  lz4 \
  iperf
echo "BOOTSTRAP: the utility packages were installed."
echo ""

echo "BOOTSTRAP: install access log profiler (alp)."
wget --quiet https://github.com/tkuchiki/alp/releases/download/v1.0.12/alp_linux_amd64.tar.gz
tar xf alp_linux_amd64.tar.gz
sudo install alp /usr/local/bin
rm alp alp_linux_amd64.tar.gz
echo "BOOTSTRAP: alp was installed."
echo ""

########################################################################################
# Prompt settings
########################################################################################

echo "BOOTSTRAP: update a prompt setting."

wget --quiet https://gist.githubusercontent.com/baycedar/f3546ebb625f774684156732724abdf8/raw/688fe687cbd17f24c0b8d50fd8e215e2ec03cab6/.bash_customize
cat << EOS >> ~/.bashrc

# load personal settings
if [ -f ~/.bash_customize ]; then
  . ~/.bash_customize
fi
EOS

wget -O ~/.dircolors https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.ansi-dark

echo "BOOTSTRAP: the prompt setting was updated. To apply change, reload a terminal."
echo ""

########################################################################################
# Environment settings
########################################################################################

echo "BOOTSTRAP: add the current user to adm group."
sudo usermod -aG adm `id -un`

echo "BOOTSTRAP: the current user was added to adm group."
echo ""

echo "BOOTSTRAP: set up global Git configs."
git config --global user.name "`hostname`"
git config --global user.email "isucon@example.com"
git config --global init.defaultBranch main

echo "BOOTSTRAP: global configs were set as follows:"
git config --global user.name
git config --global user.email
echo ""

echo "BOOTSTRAP: create a SSH-key for GitHub."
ssh-keygen -q -t ed25519 -f "${HOME}/.ssh/git_ed25519" -N ""
cat << EOF >> ${HOME}/.ssh/config

Host github.com
  User git
  IdentityFile ${HOME}/.ssh/git_ed25519
EOF

echo "BOOTSTRAP: the SSH-key was created for GitHub. Register the following public key."
cat ${HOME}/.ssh/git_ed25519.pub
echo ""

echo "BOOTSTRAP: done."

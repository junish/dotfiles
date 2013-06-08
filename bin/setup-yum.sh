#!/bin/sh

cmd() {
    echo "$PS4 $@"
    eval $@
}

INSTALL_PKGS=`cat << EOM
curl
ctags
gcc
make
git
bash-completion
tmux
perl-IPC-Run
figlet
s3cmd
yajil
system-config-lvm
gparted
jenkins
firefox
python-setuptools
createrepo
mock
xclip
EOM`

for install_pkg in $INSTALL_PKGS
do
    rpm -q $install_pkg > /dev/null
    if [ $? -ne 0 ]; then
        cmd yum -y install $install_pkg
    fi
done

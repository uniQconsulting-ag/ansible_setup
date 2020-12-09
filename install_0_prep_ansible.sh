#!/bin/bash -e
# DESC: setup ansible control host
# DATE: 20200114
# WHO: Chris Ruettimann cruettimann@uniqconsulting.ch


PDIR=/etc/ansible/projects
PNAME=uqcSetup
for PKG in git epel-release wget curl ansible
do
   rpm -q $PKG >/dev/null 2>&1 && echo $PKG is already installed || yum -y install $PKG
done

# ansible generic setup
ansibleconfigfile="/etc/ansible/ansible.cfg"
sed -i 's|^#inventory .*|inventory      = /etc/ansible/hosts|g' $ansibleconfigfile
sed -i 's|^#roles_path .*|roles_path    = /etc/ansible/roles|g' $ansibleconfigfile
sed -i 's|^#remote_user .*|remote_user = root|g' $ansibleconfigfile
sed -i 's|^#log_path .*|log_path = /var/log/ansible.log|g' $ansibleconfigfile
sed -i 's|^#nocows .*|nocows = 1|g' $ansibleconfigfile

mkdir $PDIR || true
chmod 700 $PDIR
cd $PDIR
git clone https://github.com/uniQconsulting-ag/ansible.os_basis_setup_project.git $PNAME
cd $PDIR/$PNAME
test -d roles && rm -rf roles
ansible-galaxy install uniqconsulting.open_vm_tools uniqconsulting.os_basic uniqconsulting.iptables

ansible-galaxy search uniqconsulting | cat

echo done
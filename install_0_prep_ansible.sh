#!/bin/bash -e
# DESC: setup ansible control host
# DATE: 20201209
# WHO: Melvin Suter (uniQconsulting AG)


PDIR=/etc/ansible/projects
PNAME=uqcSetup
for PKG in git epel-release wget curl ansible python3-netaddr
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
git clone https://github.com/uniQconsulting-ag/ansible_setup.git $PNAME
cd $PDIR/$PNAME
test -d roles && rm -rf roles
ansible-galaxy install uniqconsulting.open_vm_tools uniqconsulting.os_basic uniqconsulting.firewall
ansible-galaxy collection install community.mysql

rm -rf $PDIR/$PNAME/roles/uniqconsulting.os_basic/tests/install_X_*.yml
rm -rf $PDIR/$PNAME/roles/uniqconsulting.open_vm_tools/tests/install_X_*.yml
rm -rf $PDIR/$PNAME/roles/uniqconsulting.firewall/tests/install_X_*.yml
rm -rf $PDIR/$PNAME/install_0_prep_ansible.sh

ansible-galaxy search uniqconsulting | cat

echo done

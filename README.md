# Base Installation
* Run `curl https://raw.githubusercontent.com/uniQconsulting-ag/ansible_setup/master/install_0_prep_ansible.sh | sh`
* `cd /etc/ansible/projects/uqcSetup`
* Install Ansible-Roles `ansible-galaxy install XXXXX`
* Run these commands: 
```
cp roles/*/tests/vars/99_*.yml vars/
cp roles/*/tests/*_X_*.yml ./
ls -alh vars/99_*
ls -alh install_*
ls -alh task_*
```
* Edit variable files "`vim vars/99_ROLE.NAME.yml`
* Rename Playbooks `mv install_X_yyyy.yml install_0_yyyy.yml`
* Rename tasks `mv task_X_yyyy.yml task_0_yyyy.yml`
* Run Playbooks `ansible-playbook install_X_yyyy.yml`
* Generate motd `ansible-playbook task_0_create_readme.yml`
* Update Git Settings
  ``` bash
  rm -rf .git
  git init
  git remote add origin https://GITNAME/USERNAME/host.HOSTNAME.git 
  ```
* Update git repo `ansible-playbook task_1_update-repo.yml`

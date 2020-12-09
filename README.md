# Base Installation
* Run `curl https://raw.githubusercontent.com/uniQconsulting-ag/ansible.os_basis_setup_project/master/install_0_prep_ansible.sh | sh`
* `cd /etc/ansible/projects/uqcSetup`
* Install Ansible-Roles `ansible-galaxy install XXXXX`
* Copy Vars files `cp roles/*/tests/vars/99_*.yml vars/`
* Copy playbooks `cp roles/*/tests/install_X_*.yml ./`
* Copy tasks `cp roles/*/tests/task_X_*.yml ./`
* Edit Vars files `vim vars/99_ROLE.NAME.yml`
* Rename Playbooks `mv install_X_yyyy.yml install_0_yyyy.yml`
* Rename tasks `mv task_X_yyyy.yml task_0_yyyy.yml`
* Run Playbooks `ansible-playbook install_X_yyyy.yml`
* Edit motd task `vim task_0_create_readme.yml`
* Generate motd `ansible-playbook task_0_create_readme.yml`
* Update Git Settings
  ``` bash
  rm -rf .git
  git init
  git remote add origin https://GITNAME/USERNAME/host.HOSTNAME.git 
  ```
* Update git repo `ansible-playbook task_1_update-repo.yml`

# Automation_Test
Here I will be using Ansible to automate the installation of a Web Server serving up some static content. I will also be satisfying the "bonus point" requirements of the following:

[X] Using Containers as part of your automation.\
[ ] Providing a Vagrantfile to allow testing by simply running 'vagrant up'.**

** Not going to use vagrant for now since this is being developed and run on WSL2 and there are some tricky bits there.

TO RUN:

In WSL:

Navigate to where yml file exists or copy it into directory in WSL\
use playbook_exec.yml\
ansible-playbook <playbook_name> --ask-become-pass < this is important for local when you have admin creds.

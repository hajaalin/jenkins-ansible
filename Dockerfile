FROM jenkins

USER root
RUN apt-get update -y
RUN apt-get install -y git python python-setuptools
RUN easy_install pip
RUN apt-get install -y gcc
RUN apt-get install -y python-dev
RUN pip install paramiko 
RUN pip install PyYAML 
RUN pip install Jinja2 
RUN pip install httplib2 
RUN pip install six
RUN apt-get install sshpass

RUN git clone git://github.com/ansible/ansible.git --recursive
RUN cd /ansible && . hacking/env-setup
RUN chown -R jenkins /ansible
ENV PYTHONPATH /ansible/lib

RUN pip install docker-py
RUN apt-get install -y sudo
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

RUN /ansible/bin/ansible-galaxy install f500.project_deploy_module
RUN mkdir -p /ansible-modules
RUN git clone https://github.com/cmprescott/ansible-xml.git /ansible-modules/ansible-xml
RUN chown -R jenkins /ansible-modules

ENV ANSIBLE_LIBRARY /ansible-modules/ansible-xml

USER jenkins

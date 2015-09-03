# jenkins-ansible
Dockerfile with Jenkins and Ansible from GitHub

'''
docker run -p 8080:8080 -v /home/hajaalin/Jenkins:/var/jenkins_home -v /home/hajaalin/JenkinsSSH/:/ssh_keys:ro -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):/usr/bin/docker --name myjenkins jenkins-ansible
'''


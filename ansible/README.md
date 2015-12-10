# Experienced Level Infrastructure with Red Hat BPM Suite

## The Goal of This Curriculum

Is to cover activities that Foundational and Experienced practioners of Red Hat BPM Suite need to be able to perform. In general, we mean that Foundational practioners can deliver a proof of concept for a customer and that Experienced practioners are ready to participate in a project to delivery a Red Hat BPM Suite solution to production. There are Advanced activities (like performance tuning) that are outside the scope of this course, but ideally a delivery team would be lead by someone with these skills.

## Prerequisites

SSH with public/private

- https://www.youtube.com/watch?v=87i_OoHUNFo
- https://www.youtube.com/watch?v=ERp8420ucGs 
- https://www.youtube.com/watch?v=DbPDraCYju8  (we'll use ansible to do all these steps)


## Activites Covered

### Foundational

- Non-clustered local install of Business Central and Kie-Server using EAP
- Configuration of new users with properties files

These activities are covered by the [Red Hat BPM Suite Getting Started Guide](https://access.redhat.com/documentation/en-US/Red_Hat_JBoss_BPM_Suite/6.1/html/Getting_Started_Guide/chap-Installation_options.html). This course will not provide additional material on these subjects. You're instructor will provide information on how to download the product via email.


### Experienced

- Non-clustered install of Business Central and Kie-Server on a remote server using EAP
- Configuration of persistent, external database for Kie-Server
- Configuration of Business Central & Kie-Server to use custom settings.xml
- Configuration of Business Central to use remote git repositories via git hooks
⋅- We'll do this week 2
- Install update patches
- Configuration management tooling to automate all steps

All of the above activities will be taught in this course using the Ansible roles and playbooks found in this git repository. 

## What is Ansible and Why Are We Using It?

Read [Ansible's description](http://www.ansible.com/how-ansible-works) on their website. This course is using Ansible because the playbook format is incredibly easy to read. It is the closest thing to English that our industry has today for automating IT activities. Thus, using Ansible for this course allows us to learn how to install and configure infrastructure for Red Hat BPM Suite using an automated tool that reads like documentation. 

The decision to use Ansible for this course pre-dates [Red Hat's acquisition of Ansible](https://www.redhat.com/en/about/blog/why-red-hat-acquired-ansible), but it has the convenitent side effect of extending supportable options for students to use the material directly on customer engagements.

## Virtual Machines

### Red Hat
| Student        	| Design           	| Execute  			|
| -------------  	|:-------------:	| :-----:			|
| Rahman      		| 10.3.9.164 		|  10.3.11.174		|
| Olu      			| 10.3.12.169	   	|  10.3.10.168  	|
| Morgan 			| 10.3.10.218     	|  10.3.10.133		|

Red Hatters are on a RHEL 7.2 machine which can be access using `ssh cloud-user@< ip >`. The `cloud-user` has passwordless sudo priveleges. 

### TCS
| Student        	| Design           	| Execute  			|
| -------------  	|:-------------:	| :-----:			|
| Stefan 			| 209.132.178.252   |  209.132.179.137 	|
| Frank 			| 209.132.179.138   |  209.132.179.139 	|
| Joe	 			| 209.132.179.142   |  209.132.179.144 	|
| Olivier 			| 209.132.179.145   |  209.132.179.146 	|
| Wes 				| 209.132.179.147   |  209.132.179.148 	|

TCS is on a Centos 7.1 machine which can be access using `ssh centos@< ip >`. The `centos` has passwordless sudo priveleges. We have a network issue at the moment preventing the use of RHEL, but the important bits are the same

Additionally, please ensure the following ports are open on all hosts.

| Port          	|  Purpose   	|
| -------------  	|:-----:		|
| 22	 			| ssh           |
| 80	 			| http          |
| 443	 			| https			|
| 8080	 			| EAP http 		|     
| 9990 		  		| EAP admin  	|
| 9418				| git daemon	|
| 8001				| ssh daemon	|


### Perficient
| Student        	| Design           	| Execute  			|
| -------------  	|:-------------:	| :-----:			|
| Raj    			| 209.132.179.149   |  209.132.179.32 	|
| Rohan 			| 209.132.179.96    |  209.132.179.97 	|

Perficient is on a Centos 7.1 machine which can be access using `ssh centos@< ip >`. The `centos` has passwordless sudo priveleges. We have a network issue at the moment preventing the use of RHEL, but the important bits are the same

## Schedule

### Day 1

1. Download the product
2. Complete the Getting Started Guide linked in the Foundational section above
3. Edit your `/etc/ansible/hosts/` file. Create a `[bpms-design]` group and a `[bpms-execute]` group and add your corresponding server IP.
4. Ensure SSH connectivity to your lab environment. `ansible bpms-design -m ping -u cloud-user` for RHEL and `ansible bpms-design -m ping -u centos` CentOS.
5. Watch the [Quick Start Video - Introduction to Ansible Core](http://www.ansible.com/videos) video
6. [Download and install Ansible](http://docs.ansible.com/ansible/intro_installation.html)

### Day 2

1. Read through java, eap and bpms-design roles. On your first pass, only read the `- name: ` tags. These are not required by Ansible, but serve as extremely valuable documentation.
2. Edit your `/etc/ansible/hosts/` file. Create a `[bpms-design]` group and a `[bpms-execute]` group and add your corresponding server IP.
3. Run the ansible playbook `ansible-playbook bpms-design.yml` and follow the output. Notice how the output prints the `- name` tags as it progresses. Imagine how you could use this output to create documentation for a customer if required.
4. Check that the install worked by logging in to the app, which will be your ip:8080/business-central. User: jboss, pass: bpmsuite1!
5. ssh out to your bpms-design server and explore. 
6. find the jboss-as logs and read through them
7. reread the java, eap and bpms-design roles. This time focus on the variables and configuration for each command

### Day 3

1. Things to know how to do
  1. Find the EAP logs and read them.
  2. Use `sudo systemctl status|start|stop|restart jboss-as-standalone` to manage the jboss service
  3. Add your own user and log in. 
  4. Change the heap settings
  5. Using Business Central, build a KJar and see it deployed to Nexus
2. Other Challenges
  1. Change the ansible configuration to enable the EAP admin console. Run the playbook and then login to admin console.

### Day 4

1. Read through bpms-execute.yml and all the new roles that it leverages.
2. Run the play book in your role.
3. Read the [KIE-Server intro blog from Maciej Swaderski](http://mswiderski.blogspot.com/2015/09/unified-kie-execution-server-part-1.html)
4. Perform the exercises in the blog using the KJar you deployed to Nexus. I recommend [Postman](https://www.getpostman.com/) as a REST client. Also be aware that there is a [RBAC change to the REST API](http://www.schabell.org/2015/11/jboss-bpmsuite-restapi-auth-client-apps.html) - you may need to modify your user config on the KIE-Server.
5. Read [part 2 of the KIE-Server blog series from Maciej Swaderski](http://mswiderski.blogspot.com/2015/09/unified-kie-execution-server-part-2.html)
6. Perform the exercises in the blog using your KJar. Extend you process definition as need (user task).
7. Read [part 3](http://mswiderski.blogspot.com/2015/09/unified-kie-execution-server-part-3.html) and [part 4](http://mswiderski.blogspot.com/2015/09/unified-kie-execution-server-part-4.html) of the KIE-Server series. This is just an FYI.



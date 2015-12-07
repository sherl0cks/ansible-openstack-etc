# Experienced Level Infrastructure with Red Hat BPM Suite

## The Goal of This Curriculum

Is to cover activities that Foundational and Experienced practioners of Red Hat BPM Suite need to be able to perform. In general, we mean that Foundational practioners can deliver a proof of concept for a customer and that Experienced practioners are ready to participate in a project to delivery a Red Hat BPM Suite solution to production. There are Advanced activities (like performance tuning) that are outside the scope of this course, but ideally a delivery team would be lead by someone with these skills.

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
- Install update patches
- Configuration management tooling to automate all steps

All of the above activities will be taught in this course using the Ansible roles and playbooks found in this git repository. 

## What is Ansible and Why Are We Using It?

Read [Ansible's description](http://www.ansible.com/how-ansible-works) on their website. This course is using Ansible because the playbook format is incredibly easy to read. It is the closest thing to English that our industry has today for automating IT activities. Thus, using Ansible for this course allows us to learn how to install and configure infrastructure for Red Hat BPM Suite using an automated tool that reads like documentation. 

The decision to use Ansible for this course pre-dates [Red Hat's acquisition of Ansible](https://www.redhat.com/en/about/blog/why-red-hat-acquired-ansible), but it has the convenitent side effect of extending supportable options for students to use the material directly on customer engagements.

## Virtual Machines

### Red Hat
| Student        	| VM1           	| VM2  				|
| -------------  	|:-------------:	| :-----:			|
| Rahman      		| 10.3.9.164 		|  10.3.10.205		|
| Olu      			| 10.3.12.169	   	|  10.3.12.206  	|
| Morgan 			| 10.3.10.218     	|  10.3.10.247 		|

Red Hatters are on a RHEL 7.2 machine which can be access using `ssh cloud-user@< ip >`. The `cloud-user` has passwordless sudo priveleges. 

### TCS
| Student        	| VM1           	| VM2  				|
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

## Schedule

### Day 1

- Download the product
- Complete the Getting Started Guide linked in the Foundational section above
- Ensure SSH connectivity to your lab environment
- Watch the [Quick Start Video - Introduction to Ansible Core](http://www.ansible.com/videos) video
- [Download and install Ansible](http://docs.ansible.com/ansible/intro_installation.html)



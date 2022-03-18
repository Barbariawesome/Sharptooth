## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![](https://github.com/Barbariawesome/Sharptooth/blob/main/Diagrams/Network_Diagram.JPG "Virtual Azure Network")

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the ansible.cfg file may be used to install only certain pieces of it, such as Filebeat.

~/etc/ansible/roles/filebeat-playbook.yml


This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly secure, in addition to restricting access to the network.

What aspect of security do load balancers protect? 
Availability.  It provides distributed traffic across multiple servers, minimizing downtime and DDoS attack impact.

What is the advantage of a jump box?
Control access between 2 or more networks.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the network and system configuration.
Filebeat monitors the log files or locations that you specify, collects log events, and forwards them either to Elasticsearch or Logstash for indexing.

Metricbeat takes the metrics and statistics that it collects and ships them to the output that you specify, such as Elasticsearch or Logstash. Metricbeat helps you monitor your servers by collecting metrics from the system and services running.

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway     | 20.127.75.225   | Linux        
| Web-1 | Ansible/DVWA | 10.0.0.5              | Linux
| Web-2 | Ansible/DVWA | 10.0.0.6              | Linux
| Elk-1   |    Container      | 10.1.0.4              | Linux

### Access Policies

The machines on the internal network are not exposed to the public Internet.

Only the Elk-1 machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
20.127.75.225
10.0.0.5
10.0.0.6



Machines within the network can only be accessed by SSH key

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------:|:---------------------:|:----------------------:|
| Jump Box |  No             |  20.127.75.225  |
| Web-1       |  No              | 10.0.0.5      |               
| Web-2       |  No              | 10.0.0.6       |        
| Elk-1         |  Yes             | 10.1.0.4      |               

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because… 
Automation removes the capacity for errors.

What is the main advantage of automating configuration with Ansible?  It’s portable and exactly repeatable.

The playbook implements the following tasks:
In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc.

sudo apt-get update
sudo apt install docker.io
sudo docker pull cyberxsecurity/ansible:latest 
sudo docker run -ti cybersecurity/ansible:latest bash




The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.


Update the path with the name of your screenshot of docker ps output.  Docker_ps.jpg

### Target Machines & Beats
This ELK server is configured to monitor the following machines: 

Web-1
Web-2

 List the IP addresses of the machines you are monitoring:

10.0.0.5
10.0.0.6

We have installed the following Beats on these machines:

Filebeat
Metricbeat

These Beats allow us to collect the following information from each machine:

In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc.

Filebeat monitors, creates, and stores the log files in the file system for locations and events specified.  Ex: Microsoft Azure Tools.

Metricbeat collects metrics from the system and services running on the machine.  
Ex: Uptime.


### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned:

SSH into the control node and follow the steps below:

- Copy the filebeat.yml file to  ~/$ /etc/ansible/roles/filebeat-playbook.yml


- Update the Ansible hosts file to include…
Elk server IP: 10.1.0.4

     - Run the playbook, and navigate to Kibana to check that the installation worked as expected.

Answer the following questions to fill in the blanks:

Which file is the playbook? 
filebeat-playbook.yml
  

Where do you copy it? 
~/$ etc/ansible/roles/filebeat-playbook.yml


Which file do you update to make Ansible run the playbook on a specific machine?
Ansible Hosts file

How do I specify which machine to install the ELK server on versus which to install Filebeat on?
Use the IPs of the respective servers

Which URL do you navigate to in order to check that the ELK server is running?
http://104.40.67.198:5601/app/kibana
 Filebeat installation page on the ELK server GUI.
Verify that your playbook is completing Steps 1-4→ Module Status →Check Data→Verify Incoming Data. 


As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc.

```~/$ curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-8.1.0-amd64.deb```
```~/$ sudo dpkg -i filebeat-8.1.0-amd64.deb```

```~/$ ansible-playbook filebeat-playbook.yml```
```
sudo apt-get update
sudo apt install docker.io
sudo docker pull cyberxsecurity/ansible:latest 
sudo docker run -ti cyberxsecurity/ansible:latest bash
```
To generate and retrieve ssh key:
```
ssh-keygen
cat ~/.ssh/id_rsa.pub
```

```
$ sudo apt update
$ sudo apt install software-properties-common
$ sudo add-apt-repository --yes --update ppa:ansible/ansible
$ sudo apt install ansible
```
Confirm with:
```
$ ansible all -m ping --ask-pass
```


# Sharptooth

# ubuntu-kubernetes-sandbox
***

* Task: Using baremetal instructions build a vagrant file to up a Kubernetes (master/minion) on Ubuntu 14.04.

### BareMetal Instruction
http://kubernetes.io/docs/getting-started-guides/ubuntu/

#### System Setup
* Vagrant 1.7.4
* VirtualBox 5.0.26
* bento/ubuntu-14.04
* KUBE_VERSION=1.3.0; 
* export FLANNEL_VERSION=0.5.0; 
* export ETCD_VERSION=2.2.1

### Issues I've discovered thus far.
> I'm trying to install to one node at this time.
> I'm running into the same issue discovered here. https://github.com/kubernetes/kubernetes/issues/23241

### How this works so far.
* vagrant up
* vagrant ssh masternode
* sudo su -
* ssh 10.10.103.250 { Accept the key } 
* cd /home/vagrant/kubernetes/cluster/ubuntu
* export KUBE_VERSION=1.3.0; export FLANNEL_VERSION=0.5.0; export ETCD_VERSION=2.2.1; KUBERNETES_PROVIDER=ubuntu ./kube-up.sh
> Wait for the install to complete -- That takes a moment

#### Errors I'm getting 
> etcd start/running, process 22754
etcd cluster has no published client endpoints.
Try '--no-sync' if you want to access non-published client endpoints(http://127.0.0.1:2379,http://127.0.0.1:4001).
Error:  client: no endpoints available
etcd cluster has no published client endpoints.
Try '--no-sync' if you want to access non-published client endpoints(http://127.0.0.1:4001,http://127.0.0.1:2379).
Error:  client: no endpoints available
Error:  100: Key not found (/coreos.com) [3]
{"Network":"172.16.10.0/24", "Backend": {"Type": "vxlan"}}
{"Network":"172.16.10.0/24", "Backend": {"Type": "vxlan"}}
docker stop/waiting
docker start/running, process 23055
Connection to 10.10.103.250 closed.
Validating master
Validating root@10.10.103.250
Using master 10.10.103.250
cluster "ubuntu" set.
user "ubuntu" set.
context "ubuntu" set.
switched to context "ubuntu".
Wrote config for ubuntu to /root/.kube/config
... calling validate-cluster
The connection to the server 10.10.103.250:8080 was refused - did you specify the right host or port?
(kubectl failed, will retry 2 times)
The connection to the server 10.10.103.250:8080 was refused - did you specify the right host or port?
(kubectl failed, will retry 1 times)
The connection to the server 10.10.103.250:8080 was refused - did you specify the right host or port?
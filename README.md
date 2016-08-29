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
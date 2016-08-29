su -pc "git clone --depth 1 https://github.com/kubernetes/kubernetes.git; chown -R vagrant:vagrant kubernetes"
su -c 'ssh-keygen -t rsa -N "" -q -f /root/.ssh/id_rsa'
sleep 5
su -c "cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys; sleep 1; chmod 600 /root/.ssh/authorized_keys"
su -c 'eval "$(ssh-agent)"; ssh-add'
su -c 'cp /vagrant/config-default.sh /home/vagrant/kubernetes/cluster/ubuntu'
#su -pc 'cd /home/vagrant/kubernetes/cluster; export KUBE_VERSION=1.3.0; export FLANNEL_VERSION=0.5.0; export ETCD_VERSION=2.2.1; KUBERNETES_PROVIDER=ubuntu ./kube-up.sh'
#su -pc " service kube-controller-manager start"
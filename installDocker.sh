su -pc "apt-get update"
su -pc "apt-get install -y apt-transport-https ca-certificates bridge-utils linux-headers-3.13.0-93-generic curl --force-yes"
su -pc "apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D"
su -pc "echo 'deb https://apt.dockerproject.org/repo ubuntu-trusty main' >> '/etc/apt/sources.list.d/docker.list'"
su -pc "apt-get update"
su -pc "apt-get purge lxc-docker"
su -pc "apt-cache policy docker-engine"
su -pc "apt-get update"
su -pc "apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual --force-yes"
su -pc "apt-get install -y docker-engine --force-yes"
sudo stop docker
sudo start docker
su -pc "usermod -aG docker $USER"
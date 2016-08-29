#!/bin/bash

## Contains configuration values for the Ubuntu cluster

# Define all your cluster nodes, MASTER node comes first"
# And separated with blank space like <user_1@ip_1> <user_2@ip_2> <user_3@ip_3>
export nodes=${nodes:-"root@10.10.103.250"}

# Define all your nodes role: a(master) or i(minion) or ai(both master and minion),
# Roles must be the same order with the nodes.
roles=${roles:-"ai"}
# If it practically impossible to set an array as an environment variable
# from a script, so assume variable is a string then convert it to an array
export roles_array=($roles)

# Define minion numbers
export NUM_NODES=${NUM_NODES:-1}
# define the IP range used for service cluster IPs.
# according to rfc 1918 ref: https://tools.ietf.org/html/rfc1918 choose a private ip range here.
export SERVICE_CLUSTER_IP_RANGE=${SERVICE_CLUSTER_IP_RANGE:-10.10.103.0/24}  # formerly PORTAL_NET
# define the IP range used for flannel overlay network, should not conflict with above SERVICE_CLUSTER_IP_RANGE

export CNI_PLUGIN_CONF CNI_PLUGIN_EXES CNI_KUBELET_TRIGGER
CNI_PLUGIN_CONF=${CNI_PLUGIN_CONF:-""}
CNI_PLUGIN_EXES=${CNI_PLUGIN_EXES:-""}
CNI_KUBELET_TRIGGER=${CNI_KUBELET_TRIGGER:-networking}

# Flannel networking is used if CNI networking is not.  The following
# variable defines the CIDR block from which cluster addresses are
# drawn.
export FLANNEL_NET=${FLANNEL_NET:-172.16.10.0/24}

export FLANNEL_OTHER_NET_CONFIG
FLANNEL_OTHER_NET_CONFIG=''

# Admission Controllers to invoke prior to persisting objects in cluster
# If we included ResourceQuota, we should keep it at the end of the list to prevent incremeting quota usage prematurely.
export ADMISSION_CONTROL=NamespaceLifecycle,LimitRanger,ServiceAccount,SecurityContextDeny,DefaultStorageClass,ResourceQuota

# Path to the config file or directory of files of kubelet
export KUBELET_CONFIG=${KUBELET_CONFIG:-""}

# A port range to reserve for services with NodePort visibility
SERVICE_NODE_PORT_RANGE=${SERVICE_NODE_PORT_RANGE:-"30000-32767"}

# Optional: Enable node logging.
ENABLE_NODE_LOGGING=false
LOGGING_DESTINATION=${LOGGING_DESTINATION:-elasticsearch}

# Optional: When set to true, Elasticsearch and Kibana will be setup as part of the cluster bring up.
ENABLE_CLUSTER_LOGGING=false
ELASTICSEARCH_LOGGING_REPLICAS=${ELASTICSEARCH_LOGGING_REPLICAS:-1}

# Optional: When set to true, heapster, Influxdb and Grafana will be setup as part of the cluster bring up.
ENABLE_CLUSTER_MONITORING="${KUBE_ENABLE_CLUSTER_MONITORING:-false}"

# Extra options to set on the Docker command line.  This is useful for setting
# --insecure-registry for local registries.
DOCKER_OPTS=${DOCKER_OPTS:-""}

# Extra options to set on the kube-proxy command line.  This is useful
# for selecting the iptables proxy-mode, for example.
KUBE_PROXY_EXTRA_OPTS=${KUBE_PROXY_EXTRA_OPTS:-""}

# Optional: Install cluster DNS.
ENABLE_CLUSTER_DNS="${KUBE_ENABLE_CLUSTER_DNS:-false}"
# DNS_SERVER_IP must be a IP in SERVICE_CLUSTER_IP_RANGE
DNS_SERVER_IP=${DNS_SERVER_IP:-"192.168.10.10"}
DNS_DOMAIN=${DNS_DOMAIN:-"cluster.local"}
DNS_REPLICAS=${DNS_REPLICAS:-1}

# Optional: Install Kubernetes UI
ENABLE_CLUSTER_UI="${KUBE_ENABLE_CLUSTER_UI:-true}"

# Optional: Enable setting flags for kube-apiserver to turn on behavior in active-dev
#RUNTIME_CONFIG=""

# Optional: Add http or https proxy when download easy-rsa.
# Add environment variable separated with blank space like "http_proxy=http://10.x.x.x:8080 https_proxy=https://10.x.x.x:8443"
PROXY_SETTING=${PROXY_SETTING:-""}

# Optional: Allows kublet/kube-api to be run in privileged mode
ALLOW_PRIVILEGED=${ALLOW_PRIVILEGED:-"false"}

DEBUG=${DEBUG:-"false"}

# Add SSH_OPTS: Add this to config ssh port
SSH_OPTS="-oPort=22 -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -oLogLevel=ERROR"

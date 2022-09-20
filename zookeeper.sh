# Installation
# Version: 3.5.6

brew install wget
cd /Users/rajan/Downloads
wget https://archive.apache.org/dist/zookeeper/zookeeper-3.5.6/apache-zookeeper-3.5.6-bin.tar.gz
tar -zxf apache-zookeeper-3.5.6-bin.tar.gz
sudo mv apache-zookeeper-3.5.6-bin apache-zookeeper-3.5.6
sudo mv apache-zookeeper-3.5.6 /opt
cd /opt/apache-zookeeper-3.5.6
mkdir data
vim zoo.cfg

"" Add this content to the file ""
tickTime=2000
dataDir=./data/zookeeper
clientPort=2181
maxClientCnxns=60
extendedTypesEnabled=true 
emulate353TTLNodes=true
#---- file content ends here 
 
sh ./bin/zkServer.sh start
sh ./bin/zkCli.sh
 
# when wants to stop the server
sh ./bin/zkServer.sh stop

# check status
sh ./bin/zkServer.sh status


# IMP Notes:
# Ref for flags of extendedTypesEnabled: https://zookeeper.apache.org/doc/r3.5.5/zookeeperAdmin.html <--- required for TTL Nodes
# zookeeper.extendedTypesEnabled : (Java system property only: zookeeper.extendedTypesEnabled) New in 3.5.4: Define to "true" to enable extended features such as the creation of TTL Nodes. They are disabled by default. IMPORTANT: when enabled server IDs must be less than 255 due to internal limitations.

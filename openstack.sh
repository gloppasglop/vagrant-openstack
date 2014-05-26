#yum install -y http://rdo.fedorapeople.org/rdo-release.rpm
yum install -y http://repos.fedorapeople.org/repos/openstack/openstack-havana/rdo-release-havana-8.noarch.rpm
yum install -y openstack-packstack
yum install -y xauth
yum install -y virt-manager
if [ ! -d /root/.ssh ]
then
  mkdir /root/.ssh
fi
chmod 700 /root/.ssh
cp /vagrant/openstack_rsa /root/.ssh/id_rsa
cp /vagrant/openstack_rsa.pub /root/.ssh/id_rsa.pub
cp /vagrant/openstack_rsa /home/vagrant/.ssh/id_rsa
cp /vagrant/openstack_rsa.pub /root/.ssh/id_rsa.pub
touch /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys
chmod 600  /root/.ssh/id_rsa
restorecon -R -v /root/.ssh
grep openstack /root/.ssh/authorized_keys
if [ $? -ne 0 ] 
then
  cat /vagrant/openstack_rsa.pub >> /root/.ssh/authorized_keys
fi
# packstack --allinone --provision-all-in-one-ovs-bridge=n
packstack --answer-file /vagrant/answer.txt
#packstack --allinone --provision-all-in-one-ovs-bridge=n

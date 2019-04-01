#! /bin/bash
sudo yum update -y
echo "System updated!" >> /home/ec2-user/OADA.log

sudo yum install git -y 
echo "Git Installed!" >> /home/ec2-user/OADA.log

curl --silent --location https://rpm.nodesource.com/setup_8.x | sudo bash -
sudo yum -y install nodejs
echo "Node Installed!" >> /home/ec2-user/OADA.log

sudo amazon-linux-extras install docker -y
sudo service docker start
sudo usermod -a -G docker ec2-user

sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
sudo mount /tmp -o remount,exec
echo "Docker-Compose Installed!" >> /home/ec2-user/OADA.log

cd /home/ec2-user
sudo git clone https://github.com/OADA/oada-srvc-docker.git
echo "OADA Server Cloned!" >> /home/ec2-user/OADA.log

cd oada-srvc-docker/
sudo docker-compose build
sudo service docker start
sudo docker-compose run yarn
sudo service docker start
sudo docker-compose up -d
echo "OADA Server Up!" >> /home/ec2-user/OADA.log

cd /etc/rc.d/
sudo su
echo 'cd /home/ec2-user/oada-srvc-docker/' >> rc.local
echo 'sudo mount /tmp -o remount,exec' >> rc.local
echo 'sudo service docker start' >> rc.local
echo 'sudo docker-compose up -d' >> rc.local
exit
sudo chmod +x /etc/rc.d/rc.local
echo "System updated!" >> /home/ec2-user/OADA.log

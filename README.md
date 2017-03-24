# User Tracking - Rails Server


### Description
This application was mainly built on RubyOnRails and MongoDB.
Works fine both locally and on heroku.


### Requirements
* Modern browser. Currently tested on Firefox 52;
* MongoDB 3.4;
* RubyOnRails 5.0;
* NodeJS 7.7.

### Install
#### For Ubuntu 16.10 x64
###### MongoDB
```bash
sudo apt install mongodb-server
```

###### NPM
```bash
if ! [ -d /opt/ ]; then sudo mkdir /opt/ ; fi;
sudo chmod 777 /opt/
wget https://nodejs.org/dist/node-latest.tar.gz -O /opt/node.tgz
cd /opt/
sudo rm -rf /opt/node/
tar -xzvf /opt/node.tgz
mv /opt/node-* /opt/node/
cd /opt/node/
./configure
make
sudo make install
rm -f /opt/node.tgz
echo -e "\nexport PATH=\"\$PATH:/opt/node/bin\" # NodeJS" >> ~/.bashrc
source ~/.bashrc
```

###### Rails (RVM)
```bash
sudo apt install curl
\curl -sSL https://get.rvm.io | bash -s stable --rails
echo -e "\nsource /home/tester/.rvm/scripts/rvm" # Ruby" >> ~/.bashrc
```

###### Application
```bash
sudo npm install -g uglify-js@latest
sudo apt install git-core uglifier
git clone https://github.com/andrehtissot/resultados-digitais-log-server.git
cd resultados-digitais-log-server
bundle install
rails s
```

### Behavior
There are two controllers: contacts and logs, both are called from the example web page.
To read the contact info, sent from the example web pages, open a  http://localhost:3000/contacts, or the heroku https://resultados-digitais-log-server.herokuapp.com/contacts.

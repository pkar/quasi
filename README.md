# Quasi

Virtualization/containering(?sp) of services.


## Mac OS X
```bash
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

brew tap phinze/homebrew-cask 
brew install brew-cask
brew cask install vagrant
brew cask install virtualbox
brew install packer
```

### Build Vagrant ubuntu 12.04 box with docker and go installed
```bash
packer build packer.json
vagrant box add dev packer_virtualbox-iso_virtualbox.box
```

### Run Vagrant box and login
```bash
vagrant up
vagrant ssh
```

### Within the Vagrant box build all docker containers.
```bash
cd /vagrant
./services.sh
```

In /etc/hosts add private address
```bash
192.168.33.10 localhost.vagrant
```

At this point you can access any service directly at localhost.vagrant:port outside the vagrant box


__̴ı̴̴̡̡̡ ̡͌l̡̡̡ ̡͌l̡*̡̡ ̴̡ı̴̴̡ ̡̡͡|̲̲̲͡͡͡ ̲▫̲͡ ̲̲̲͡͡π̲̲͡͡ ̲̲͡▫̲̲͡͡ ̲|̡̡̡ ̡ ̴̡ı̴̡̡ ̡͌l̡̡̡̡.___

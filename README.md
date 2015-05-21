## puppet-swarm

A Puppet module to install the latest swarm-cli on Linux

### Prerequisite

Installed Git and Puppet:

On Ubuntu/Debian:
```
sudo apt-get install git puppet
```
Verify 
```
git --version
```
should print something like
```
git version 1.9.1
```

```
puppet --version
```
should print something like
```
3.7.5
```

### Checkout

```
git clone https://github.com/tomask-de/puppet-swarm.git
```

### Run Puppet

```
cd puppet-swarm
sudo puppet apply -d -v --modulepath=modules manifests/site.pp
```

### Verify

```
swarm version
```
should print
```
swarm version 0.17.0, build c16d601006
```

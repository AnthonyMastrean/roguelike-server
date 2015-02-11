# Roguelike Server

A roguelike SSH server so I can be a bigger nerd!

## Getting Started

Clone this repository. Start the Vagrant development machine.

```
$ vagrant up fpm
```

SSH into the box, install the required gems, and check on the manifests.

```
$ vagrant ssh fpm --command 'pushd /vagrant && bundle install && rake'
```

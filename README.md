# Roguelike Server

A roguelike SSH server so I can be a bigger nerd!

## Getting Started

Clone this repository. Start the Vagrant development machine.

```
$ vagrant up fpm
```

SSH into the box and install the required gems.

```
$ vagrant ssh fpm --command 'pushd /vagrant && bundle install'
```

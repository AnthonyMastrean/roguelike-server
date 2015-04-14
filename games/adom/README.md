# Ancient Domains of Mystery (ADOM)

Download and extract the sources

```
$ wget --quiet --output-document - http://www.ancardia.com/download/adom_linux_ubuntu_64_1.2.0_pre23.tar.gz | tar --extract --gzip --strip-components 1
```

Install the prerequisites

```
$ bundle install --deployment
```

And ask Rake to generate the package

```
$ bundle exec rake
```

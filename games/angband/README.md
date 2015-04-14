# Ancient Domains of Mystery (ADOM)

Download and extract the sources

```
$ wget --quiet --output-document - http://rephial.org/downloads/3.5/angband-v3.5.1.tar.gz | tar --extract --gzip --strip-components 1
```

Install the prerequisites

```
$ bundle install --deployment
```

And ask Rake to generate the package

```
$ bundle exec rake
```

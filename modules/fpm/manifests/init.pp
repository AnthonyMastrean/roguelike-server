class fpm() {

  package { ["ruby-dev", "rpm", "make"]:
  }

  exec { "gem install fpm":
    path => ["/opt/vagrant_ruby/bin"],
    command => "gem install fpm --no-rdoc --no-ri",
    require => Package["ruby-dev"],
  }

}

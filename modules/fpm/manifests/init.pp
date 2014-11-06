class fpm() {

  exec { "gem install fpm":
    path => ["/opt/vagrant_ruby/bin"],
    require => Package["ruby-dev"],
  }

}

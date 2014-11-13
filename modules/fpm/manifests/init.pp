class fpm() {

  include fpm::deps

  exec { "gem install fpm":
    path => ["/opt/vagrant_ruby/bin"],
    command => "gem install fpm --no-rdoc --no-ri",
    creates => "/opt/vagrant_ruby/bin/fpm",
    require => Class["fpm::deps"],
  }

}

package { ["ruby-dev", "gcc"]:
}

exec { "gem install fpm":
  require => Package["ruby-dev", "gcc"],
}

class adom::shell() {

  include adom

  group { "adom":
    ensure => present,
  }

  user { "adom":
    gid => "adom",
    password => sha1("adom"),
    managehome => true,
    home => "/home/adom",
    shell => $adom::target,
    require => Group["adom"],
  }

  file { "/home/adom":
    ensure => directory,
    owner => "adom",
    group => "adom",
    require => User["adom"],
  }

  file { "/home/adom/.hushlogin":
    ensure => present,
    require => File["/home/adom"],
  }

}

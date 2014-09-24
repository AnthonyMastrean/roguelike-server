class angband::shell() {

  include angband

  group { "angband":
    ensure => present,
  }

  user { "angband":
    gid => "angband",
    password => sha1("angband"),
    managehome => true,
    home => "/home/angband",
    shell => $angband::target,
    require => Group["angband"],
  }

  file { "/home/angband":
    ensure => directory,
    owner => "angband",
    group => "angband",
    require => User["angband"],
  }

  file { "/home/angband/.hushlogin":
    ensure => present,
    require => File["/home/angband"],
  }

}

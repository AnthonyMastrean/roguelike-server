class crawl() {

  user { $name:
    gid => "games",
    password => sha1($name),
    managehome => true,
    home => "/home/${name}",
    shell => $target,
    require => Group["games"],
  }

  file { "${token}.list":
    path => "/etc/apt/sources.list.d/${token].list",
    owner => root,
    group => root,
    mode => "a=r,u+w",
    content => "deb http://crawl.develz.org/debian crawl 0.15",
    notify => Exec["apt-get update"],
  }

  exec { "":
    command => "wget http://crawl.develz.org/debian/pubkey -O - | apt-key add -",
    require => File["${token}.list"],
    notify => Exec["apt-get update"],
  }

}

class crawl() {
  $version = "0.15"
  $token = "${name}-${version}"

  file { "${token}.list":
    path => "/etc/apt/sources.list.d/${name}.list",
    owner => root,
    group => root,
    mode => "a=r,u+w",
    content => "deb http://crawl.develz.org/debian crawl 0.15",
    notify => Exec["apt-get update"],
  }

  exec { "wget crawl.develz.org":
    command => "wget http://crawl.develz.org/debian/pubkey -O - | apt-key add -",
    notify => Exec["apt-get update"],
    require => File["${name}.list"],
  }

  package { "crawl":
    require => Exec["wget crawl.develz.org"],
  }

}

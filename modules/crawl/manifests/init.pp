class crawl() {
  $version = "0.15"
  $package = "${name}-${version}"

  exec { "${name} update":
    path => ["/usr/bin"],
    command => "apt-get update",
  }

  file { "${name}.list":
    path => "/etc/apt/sources.list.d/${name}.list",
    owner => root,
    group => root,
    mode => "a=r,u+w",
    content => "deb http://crawl.develz.org/debian crawl 0.15",
  }

  exec { "wget crawl.develz.org":
    path => ["/bin", "/usr/bin"],
    command => "bash -c 'wget http://crawl.develz.org/debian/pubkey -O - | apt-key add -'",
    require => File["${name}.list"],
    notify => Exec["${name} update"],
  }

  package { "crawl":
    require => Exec["wget crawl.develz.org"],
  }

}

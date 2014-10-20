class brogue() {
  $url = "https://sites.google.com/site/broguegame/brogue-1.7.4-linux-i386.tbz2"
  $version = "1.7.4"
  $token = "${name}-${version}"

  exec { "wget ${token}":
    cwd => "/tmp",
    command => "wget -O ${token}.tar.gz ${url}",
    creates => "/tmp/${token}.tar.gz",
    require => Package["wget"],
  }

  exec { "extract ${token}":
    cwd => "/tmp",
    command => "tar --extract --gzip --verbose --file ${token}.tar.gz",
    creates => "/tmp/brogue-1.7.4",
    require => Exec["wget ${token}"],
  }

  exec { "install ${token}":
    cwd => "/tmp/brogue-1.7.4",
    command => "bash -c 'make curses'",
    creates => $install,
    require => Exec["extract ${token}"],
  }
  
}

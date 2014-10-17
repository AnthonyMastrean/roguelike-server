class angband() {
  $url = "http://rephial.org/downloads/3.5/angband-v3.5.0.tar.gz"
  $version = "3.5.0"
  $token = "${name}-${version}"
  $install = "/usr/local/games/${token}"
  $target = "${install}/games/angband"

  require angband::deps
  
  exec { "wget ${token}":
    cwd => "/tmp",
    command => "wget -O ${token}.tar.gz ${url}",
    creates => "/tmp/${token}.tar.gz",
    require => Package["wget"],
  }

  exec { "extract ${token}":
    cwd => "/tmp",
    command => "tar --extract --gzip --verbose --file ${token}.tar.gz",
    creates => "/tmp/angband-v3.5.0",
    require => Exec["wget ${token}"],
  }

  exec { "install ${token}":
    cwd => "/tmp/angband-v3.5.0",
    command => "bash -c './configure --prefix ${install} && make && make install'",
    creates => $install,
    require => Exec["extract ${token}"],
  }
  
}

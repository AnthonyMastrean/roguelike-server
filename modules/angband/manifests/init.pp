class angband() {
  $version = "3.5.0"
  $token = "${name}-${version}"

  $url = "http://rephial.org/downloads/3.5/angband-v3.5.0.tar.gz"
  $archive = "angband-v3.5.0.tar.gz"
  $sources = "angband-v3.5.0"

  $install = "/usr/local/games/${token}"
  $target = "${install}/games/angband"

  include roguelike

  require angband::deps
  
  exec { "wget ${token}":
    cwd => "/tmp",
    command => "wget ${url}",
    creates => "/tmp/${archive}",
    require => Package["wget"],
  }

  exec { "extract ${token}":
    cwd => "/tmp",
    command => "tar --extract --gzip --verbose --file ${archive}",
    creates => "/tmp/${sources}",
    require => Exec["wget ${token}"],
  }

  exec { "install ${token}":
    cwd => "/tmp/${sources}",
    command => "bash -c './configure --prefix ${install} && make && make install'",
    creates => $install,
    require => Exec["extract ${token}"],
  }

  file { $install:
    ensure => directory,
    recurse => true,
    owner => $name,
    group => "games",
    require => Exec["install ${token}"],
  }

  roguelike { $name:
    shell => $target,
    require => Exec["install ${token}"],
  }

}

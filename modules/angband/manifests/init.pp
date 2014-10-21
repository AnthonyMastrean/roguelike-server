class angband() {
  $version = "3.5.0"
  $token = "${name}-${version}"
  $install = "/usr/local/games/${token}"
  $target = "${install}/games/angband"

  include archive
  include wget
  # include angband::deps
  
  wget::fetch { $token:
    url => "http://rephial.org/downloads/3.5/angband-v3.5.0.tar.gz",
    target => "/tmp/${token}.tar.gz",
  }

  archive::extract { $token:
    source => "/tmp/${token}.tar.gz",
    target => "/tmp",
    root => "angband-v3.5.0",
    require => Wget::Fetch[$token],
  }

  # exec { "install ${token}":
  #   cwd => "/tmp/angband-v3.5.0",
  #   command => "bash -c './configure --prefix ${install} && make && make install'",
  #   creates => $install,
  #   require => Exec["extract ${token}"],
  # }
  
}

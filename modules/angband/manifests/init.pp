class angband() {
  $id = "angband-v3.5.0"
  $filename = "${id}.tar.gz"
  $url = "http://rephial.org/downloads/3.5/${filename}"
  $install_dir = "/usr/local/games/${id}"
  $target = "${install_dir}/games/angband"

  include angband::deps
  
  exec { "download":
    cwd => "/tmp",
    command => "wget ${url}",
    creates => "/tmp/${filename}",
    require => Package["wget"],
  }

  exec { "unpack":
    cwd => "/tmp",
    command => "tar --extract --gzip --verbose --file ${filename}",
    creates => "/tmp/${id}",
    require => Exec["download"],
  }

  exec { "install":
    cwd => "/tmp/${id}",
    command => "bash -c './configure --prefix ${install_dir} && make && make install'",
    creates => $install_dir,
    require => [Class["Angband::Deps"], Exec["unpack"]],
  }
}

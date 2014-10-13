class adom() {
	$url = "http://www.ancardia.com/download/adom_linux_ubuntu_32_1.2.0_pre23.tar.gz"
	$version = "1.2.0_pre23"
	$token = "${name}-${version}"
	$install = "/usr/local/games/${token}"
	$target = "${install}/adom"

	exec { "wget ${token}":
		cwd => "/tmp",
		command => "wget -O ${token}.tar.gz ${url}",
		creates => "/tmp/${token}.tar.gz",
		require => Package["wget"],
	}

	exec { "extract ${token}":
		cwd => "/tmp",
		command => "tar --extract --gzip --verbose --file ${token}.tar.gz",
		creates => "/tmp/adom",
		require => Exec["wget ${token}"],
	}

	exec { "install ${token}":
		command => "mv /tmp/adom ${install}",
		creates => $install,
		require => Exec["extract ${token}"],
	}

  file { $install:
    ensure => directory,
    recurse => true,
    owner => $name,
    gid => "games",
    require => Exec["install ${token}"],
  }

  user { $name:
    gid => "games",
    password => sha1($name),
    managehome => true,
    home => "/home/${name}",
    shell => $target,
    require => Group["games"],
  }

  file { "/home/${name}":
    ensure => directory,
    owner => $name,
    group => "games",
    require => User[$name],
  }

  file { "/home/${name}/.hushlogin":
    ensure => present,
    owner => $name,
    group => "games",
    require => File["/home/${name}"],
  }

}

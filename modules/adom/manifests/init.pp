class adom() {
	$version = "1.2.0_pre23"
	$token = "${name}-${version}"

	$url = "http://www.ancardia.com/download/adom_linux_ubuntu_32_1.2.0_pre23.tar.gz"
	$archive = "adom_linux_ubuntu_32_1.2.0_pre23.tar.gz"
	$sources = "adom"

	$install = "/usr/local/games/${token}"
	$target = "${install}/adom"

	include roguelike

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
		command => "mv /tmp/${sources} ${install}",
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

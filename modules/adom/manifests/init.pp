class adom() {
	$id = "adom_linux_ubuntu_32_1.2.0_pre23"
	$filename = "${id}.tar.gz"
	$url = "http://www.ancardia.com/download/${filename}"

	package { "wget":
	}

	exec { "download":
		command => "wget ${url}",
		creates => "/home/vagrant/${filename}",
		require => Package["wget"],
	}

	exec { "unpack":
		command => "tar --extract --gzip --verbose --file ${filename}",
		creates => "/home/vagrant/adom",
		require => Exec["download"],
	}

	exec { "rename":
		command => "mv adom ${id}",
		creates => "/home/vagrant/${id}",
		require => Exec["unpack"],
	}
}

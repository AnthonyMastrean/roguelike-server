class adom() {
	$name = "adom_linux_ubuntu_32_1.2.0_pre23"
	$filename = "${name}.tar.gz"
	$url = "http://www.ancardia.com/download/${filename}"

	package { "wget":
	}

	exec { "download":
		command => "wget ${url}",
		require => Package["wget"],
	}

	exec { "unpack":
		command => "tar --extract --gzip --verbose --file ${filename}",
		require => Exec["download"],
	}

	exec { "rename":
		command => "mv adom ${name}",
		require => Exec["unpack"],
	}
}

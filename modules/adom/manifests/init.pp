class adom() {
	$id = "adom_linux_ubuntu_32_1.2.0_pre23"
	$filename = "${id}.tar.gz"
	$url = "http://www.ancardia.com/download/${filename}"
	$install_dir = "/usr/local/games/${id}"
	$target = "${install_dir}/adom"

	exec { "download":
		cwd => "/tmp",
		command => "wget ${url}",
		creates => "/tmp/${filename}",
		require => Package["wget"],
	}

	exec { "unpack":
		cwd => "/tmp",
		command => "tar --extract --gzip --verbose --file ${filename}",
		creates => "/tmp/adom",
		require => Exec["download"],
	}

	exec { "install":
		command => "mv /tmp/adom ${install_dir}",
		creates => $install_dir,
		require => Exec["unpack"],
	}
}

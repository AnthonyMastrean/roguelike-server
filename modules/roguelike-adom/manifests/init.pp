class roguelike-adom() {
	$url = "http://www.ancardia.com/download/adom_linux_ubuntu_32_1.2.0_pre23.tar.gz"

	$version = "1.2.0_pre23"
	$package = "${name}-${version}"

	$archive = "/tmp/adom_linux_ubuntu_32_1.2.0_pre23.tar.gz"
	$target = "/usr/local/games/adom"

	include archive
	include wget

	wget::fetch { $package:
		url => $url,
		target => $archive,
	}

	archive::extract { $package:
		source => $archive,
		target => "/usr/local/games",
		pathname => "adom/adom",
		strip_path => 1,
		creates => $target,
		require => Wget::Fetch[$package],
	}

}

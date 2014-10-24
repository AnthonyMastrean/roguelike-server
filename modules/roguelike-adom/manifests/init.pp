class roguelike-adom() {
	$package = "adom-1.2.0_pre23"
	$url = "http://www.ancardia.com/download/adom_linux_ubuntu_32_1.2.0_pre23.tar.gz"
	$archive = "/tmp/adom_linux_ubuntu_32_1.2.0_pre23.tar.gz"
	$target = "/usr/local/games/adom"

	include roguelike

	roguelike::fetch { $package:
		url => $url,
		target => $archive,
	}

	roguelike::extract { $package:
		source => $archive,
		target => "/usr/local/games",
		pathname => "adom/adom",
		strip_path => 1,
		creates => $target,
		require => Roguelike::Fetch[$package],
	}

}

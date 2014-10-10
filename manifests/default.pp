Exec { 
	path => ["/bin", "/usr/bin"],
}

exec { "apt-get update":
}

package { [
  "make",
  "gcc",
  "wget"]:
  require => Exec["apt-get update"],
}

group { "games":
  ensure => present,
}

include adom
include angband

roguelike::shell { "adom":
  shell => $adom::target,
  require => Class["adom"],
}

roguelike::shell { "angband":
  shell => $angband::target,
  require => Class["angband"],
}

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

package { ["angband", "crawl"]:
}

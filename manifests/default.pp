Exec { 
	path => ["/bin", "/usr/bin"],
}

# exec { "apt-get update":
# }

# package { [
#   "make",
#   "gcc",
#   "wget"]:
#   require => Exec["apt-get update"],
# }

group { "games":
}

package { ["angband", "crawl"]:
}

roguelike::shell { "angband":
  shell => "/usr/games/angband",
  require => Package["angband"],
}

roguelike::shell { "crawl":
  shell => "/usr/games/crawl",
  require => Package["crawl"],
}

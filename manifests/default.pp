Exec { 
	path => ["/bin", "/usr/bin"],
}

exec { "apt-get update":
}

# package { [
#   "make",
#   "gcc",
#   "wget"]:
#   require => Exec["apt-get update"],
# }

group { "games":
}

package { ["angband", "crawl"]:
  require => Exec["apt-get update"],
}

roguelike::shell { "angband":
  game => "/usr/games/angband",
  args => "-mgcu",
  require => Package["angband"],
}

roguelike::shell { "crawl":
  game => "/usr/games/crawl",
  require => Package["crawl"],
}

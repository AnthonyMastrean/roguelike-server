group { "games":
}

package { ["angband", "crawl"]:
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

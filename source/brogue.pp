class roguelike-brogue() {
  $package = "brogue-1.7.4"
  $url = "https://sites.google.com/site/broguegame/brogue-1.7.4-linux-i386.tbz2"
  $archive = "/tmp/brogue-1.7.4-linux-i386.tbz2"
  $source = "/tmp/brogue-1.7.4"
  $target = "/tmp/brogue-1.7.4/bin/brogue"
  $link = "/usr/local/games/brogue"

  include roguelike

  roguelike::fetch { $package:
    url => $url,
    target => $archive,
  }

  roguelike::extract { $package:
    source => $archive,
    archive => bzip2,
    target => "/tmp",
    creates => $source,
    require => Roguelike::Fetch[$package],
  }

  roguelike::make { $package:
    source => $source,
    label => curses,
    creates => $target,
    require => Roguelike::Extract[$package],
  }

  file { $link:
    ensure => link,
    target => $target,
    require => Roguelike::Make[$package],
  }
  
}

class brogue() {
  $url = "https://sites.google.com/site/broguegame/brogue-1.7.4-linux-i386.tbz2"

  $version = "1.7.4"
  $package = "${name}-${version}"

  $archive = "/tmp/brogue-1.7.4-linux-i386.tbz2"
  $source = "/tmp/brogue-1.7.4"
  $target = "/tmp/brogue-1.7.4/bin/brogue"
  $link = "/usr/local/games/brogue"

  include archive
  include make
  include wget

  wget::fetch { $package:
    url => $url,
    target => $archive,
  }

  archive::extract { $package:
    source => $archive,
    archive => bzip2,
    target => "/tmp",
    creates => $source,
    require => Wget::Fetch[$package],
  }

  make::install { $package:
    source => $source,
    label => curses,
    creates => $target,
    require => Archive::Extract[$package],
  }

  file { $link:
    ensure => link,
    target => $target,
    require => Make::Install[$package],
  }
  
}

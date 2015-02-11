class roguelike-angband() {
  $package = "angband-3.5.0"
  $url = "http://rephial.org/downloads/3.5/angband-v3.5.0.tar.gz"
  $archive = "/tmp/angband-v3.5.0.tar.gz"
  $source = "/tmp/angband-v3.5.0"
  $target = "/usr/local/games/angband"

  $dependencies = [
    # "libglade2-dev"
    # "libgtk2.0-dev"
    # "libsdl1.2-dev"
    # "libsdl-image1.2-dev"
    # "libsdl-mixer1.2-dev"
    # "libsdl-ttf2.0-dev"
    # "libx11-dev"
    "libc6-dev",
    "libncurses5-dev",
    "libncursesw5-dev"]

  include roguelike
  
  package { $dependencies: 
  }

  roguelike::fetch { $package:
    url => $url,
    target => $archive,
  }

  roguelike::extract { $package:
    source => $archive,
    target => "/tmp",
    creates => $source,
    require => Roguelike::Fetch[$package],
  }

  roguelike::make { $package:
    source => $source,
    configure => true,
    creates => $target,
    require => [Roguelike::Extract[$package], Package[$dependencies]],
  }

}

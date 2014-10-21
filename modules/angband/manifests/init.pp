class angband() {
  $url = "http://rephial.org/downloads/3.5/angband-v3.5.0.tar.gz"
  
  $version = "3.5.0"
  $package = "${name}-${version}"

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
    "libncursesw5-dev"],

  include archive
  include make
  include wget
  
  package { $dependencies: 
  }

  wget::fetch { $package:
    url => $url,
    target => $archive,
  }

  archive::extract { $package:
    source => $archive,
    target => "/tmp",
    creates => $source,
    require => Wget::Fetch[$package],
  }

  make::install { $package:
    source => $source,
    configure => true,
    creates => $target,
    require => [Archive::Extract[$package], Package[$dependencies]],
  }

}

class angband() {
  $version = "3.5.0"
  $token = "${name}-${version}"
  $target = "/usr/local/games/angband"

  $dependencies => [
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

  archive::extract { $token:
    source => "/tmp/${token}.tar.gz",
    target => "/tmp",
    root => "angband-v3.5.0",
    require => Wget::Fetch[$token],
  }

  make::install { $package:
    source => $source,
    configure => true,
    target => $target,
    require => [Archive::Extract[$package], Package[$dependencies]],
  }

}

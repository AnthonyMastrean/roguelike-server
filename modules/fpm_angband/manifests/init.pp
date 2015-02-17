class fpm_angband() {

  $url            = 'http://rephial.org/downloads/3.5/angband-v3.5.1.tar.gz'

  $package        = 'angband'
  $version        = '3.5.1'

  $archive        = "/tmp/${package}-${version}.tar.gz"
  $workingdir     = "/tmp/${package}-${version}"
  $creates        = "/tmp/${package}-${version}/version"
  $target         = '/usr/games/angband'

  $dependencies   = [
                      'libc6-dev',
                      'libncurses5-dev',
                      'libncursesw5-dev'
                    ]

  $configure_opts = '--disable-x11'
  $args           = '/usr/games/angband /etc/angband /usr/share/angband'

  package { $dependencies:
    ensure => present,
  }

  file { $workingdir:
    ensure => directory,
  }

  fpm::fetch { $url:
    target => $archive,
  }

  fpm::extract { $archive:
    target     => $workingdir,
    strip_path => 1,
    creates    => $creates,
    require    => Fpm::Fetch[$url],
  }

  fpm::make { $workingdir:
    configure      => true,
    configure_opts => $configure_opts,
    creates        => $target, 
    require        => [Fpm::Extract[$archive], Package[$dependencies]],
  }

  # fpm::exec { $package:
  #   cwd          => '/tmp/packages',
  #   output       => deb,
  #   input        => dir,
  #   version      => $version,
  #   searchdir    => $installdir,
  #   args         => $args,
  #   dependencies => $dependencies,
  #   require      => Fpm::Make[$workingdir],
  # }

}

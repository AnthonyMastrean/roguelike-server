class fpm_adom() {

  $package      = 'adom'
  $version      = '1.2.0_pre23'
  $nonce        = "${package}-${version}"
  $url          = 'http://www.ancardia.com/download/adom_linux_ubuntu_64_1.2.0_pre23.tar.gz'
  $archive      = "/tmp/${nonce}.tar.gz"
  $source       = "/tmp/${nonce}"
  $searchdir    = "/tmp/${nonce}/adom"

  include fpm

  file { $source:
    ensure => directory,
  }

  fpm::fetch { $nonce:
    url    => $url,
    target => $archive,
  }

  fpm::extract { $nonce:
    source  => $archive,
    target  => $source,
    creates => $searchdir,
    require => Fpm::Fetch[$nonce],
  }

  fpm::exec { $nonce:
    cwd       => '/vagrant/packages',
    output    => rpm,
    source    => dir,
    package   => $package,
    version   => $version,
    searchdir => $searchdir,
    args      => [
      ' adom=/usr/games/adom',
      ' docs/=/usr/share/doc/adom',
      ' licenses=/usr/share/doc/adom',
    ],
    require   => Fpm::Extract[$nonce],
  }

}

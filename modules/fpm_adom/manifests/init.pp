class fpm_adom() {

  $package      = 'adom'
  $version      = '1.2.0_pre23'
  $nonce        = "${package}-${version}"
  $output       = 'rpm'
  $source       = 'dir'
  $url          = 'http://www.ancardia.com/download/adom_linux_ubuntu_64_1.2.0_pre23.tar.gz'
  $cwd          = '/tmp/packages'
  $archive      = "/tmp/downloads/${nonce}.tar.gz"
  $source       = "/tmp/${nonce}"
  $searchdir    = "/tmp/${nonce}/adom"
  $args         = [
    ' adom=/usr/games/adom',
    ' docs/=/usr/share/doc/adom',
    ' licenses=/usr/share/doc/adom',
  ]

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
    cwd       => $cwd,
    output    => $output,
    source    => $source,
    package   => $package,
    version   => $version,
    searchdir => $searchdir,
    args      => $args,
    require   => Fpm::Extract[$nonce],
  }

}

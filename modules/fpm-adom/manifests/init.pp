class fpm-adom() {

  $package = "adom"
  $version = "1.2.0_pre23"
  $architecture = i386
  $nonce = "${package}-${version}-${architecture}"
  $url = "http://www.ancardia.com/download/adom_linux_ubuntu_32_1.2.0_pre23.tar.gz"
  $archive = "/tmp/${nonce}.tar.gz"
  $source = "/tmp/${nonce}"
  $searchdir = "/tmp/${nonce}/adom"

  include fpm
  include quux

  file { $source:
    ensure => directory,
  }

  quux::fetch { $nonce:
    url => $url,
    target => $archive,
  }

  quux::extract { $nonce:
    source => $archive,
    target => $source,
    creates => $searchdir,
    require => Quux::Fetch[$nonce],
  }

  fpm::exec { $nonce:
    cwd => "/vagrant/packages",
    output => rpm,
    source => dir,
    package => $package,
    version => $version,
    architecture => $architecture,
    searchdir => $searchdir,
    args => [
      " adom=/usr/games/adom", 
      " docs/=/usr/share/doc/adom", 
      " licenses=/usr/share/doc/adom",
    ],
    require => Quux::Extract[$nonce],
  }

}

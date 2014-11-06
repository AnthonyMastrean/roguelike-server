class fpm-adom() {

  $package = "adom"
  $version = "1.2.0_pre23"
  $architecture = i386
  $nonce = "${package}-${version}-${architecture}"
  $url = "http://www.ancardia.com/download/adom_linux_ubuntu_32_1.2.0_pre23.tar.gz"
  $archive = "/tmp/${nonce}.tar.gz"
  $source = "/tmp/${nonce}"

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
    strip_path => 1,
    creates => "${source}/adom",
    require => Quux::Fetch[$nonce],
  }

  # fpm -t rpm -s dir --name "adom" --version 1.2.0_pre23 --architecture i386 ./adom/adom=/usr/games/adom ./adom/docs/=/usr/share/doc/adom ./adom/licenses=/usr/share/doc/adom
  fpm::exec { $nonce:
    output => rpm,
    source => dir,
    package => $package,
    version => $version,
    architecture => $architecture,
    args => [
      " ${source}/adom=/usr/games/adom", 
      " ${source}/docs/=/usr/share/doc/adom", 
      " ${source}/licenses=/usr/share/doc/adom"
    ],
    require => Quux::Extract[$nonce],
  }

}

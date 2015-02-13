class fpm_adom() {

  $url          = 'http://www.ancardia.com/download/adom_linux_ubuntu_64_1.2.0_pre23.tar.gz'

  $package      = 'adom'
  $version      = '1.2.0_pre23'
  $architecture = 'x86_64'

  $nonce        = "${package}-${version}-${architecture}"

  $cwd          = '/tmp/packages'
  $archive      = "/tmp/downloads/${nonce}.tar.gz"
  $workingdir   = "/tmp/${nonce}"
  $searchdir    = "/tmp/${nonce}/adom"

  $output       = 'rpm'
  $input        = 'dir'
  $args         = [
                    ' adom=/usr/games/adom',
                    ' docs/=/usr/share/doc/adom',
                    ' licenses=/usr/share/doc/adom',
                  ]

  file { $workingdir:
    ensure => directory,
  }

  fpm::fetch { $nonce:
    url    => $url,
    target => $archive,
  }

  fpm::extract { $nonce:
    source  => $archive,
    target  => $workingdir,
    creates => $searchdir,
    require => Fpm::Fetch[$nonce],
  }

  fpm::exec { $nonce:
    cwd          => $cwd,
    output       => $output,
    input        => $input,
    package      => $package,
    version      => $version,
    architecture => $architecture,
    searchdir    => $searchdir,
    args         => $args,
    require      => Fpm::Extract[$nonce],
  }

}

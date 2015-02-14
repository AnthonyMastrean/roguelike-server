class fpm_adom() {

  $url        = 'http://www.ancardia.com/download/adom_linux_ubuntu_64_1.2.0_pre23.tar.gz'

  $package    = 'adom'
  $version    = '1.2.0_pre23'

  $archive    = "/tmp/${package}-${version}.tar.gz"
  $workingdir = "/tmp/${package}-${version}"
  $creates    = "/tmp/${package}-${version}/adom"

  $output     = 'rpm'
  $input      = 'dir'
  $args       = 'adom=/usr/games/adom licenses=/usr/share/doc/adom/ docs/adomfaq.txt=/usr/share/doc/adom/ docs/credits.txt=/usr/share/doc/adom/ docs/manual.txt=/usr/share/doc/adom/ docs/readme1st.txt=/usr/share/doc/adom/'

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

  fpm::exec { $package:
    cwd          => '/tmp/packages',
    output       => $output,
    input        => $input,
    version      => $version,
    searchdir    => $workingdir,
    args         => $args,
    require      => Fpm::Extract[$archive],
  }

}

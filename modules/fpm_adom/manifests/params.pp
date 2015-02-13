class fpm_adom::params() {

  $url          = 'http://www.ancardia.com/download/adom_linux_ubuntu_64_1.2.0_pre23.tar.gz'

  $package      = 'adom'
  $version      = '1.2.0_pre23'
  $architecture = 'x86_64'

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

}

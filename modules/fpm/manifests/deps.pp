class fpm::deps() {

  package { [
    'fpm',
    'puppet-lint',
    'rake'
  ]:
    ensure   => present,
    provider => gem,
    require  => [
      File['/etc/gemrc'],
      Package['rubygems'],
    ],
  }

  package { [
    'build-essential',
    'gcc',
    'make',
    'rpm',
    'ruby',
    'rubygems',
    'ruby-dev',
    'tar',
    'wget'
  ]:
    ensure => present,
  }

}

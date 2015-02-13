class fpm::deps() {

  package { [
    'bundler',
    'fpm', 
    'puppet-lint', 
    'rake'
  ]:
    ensure   => present,
    provider => gem,
    require  => File['/etc/gemrc'],
  }

  package { [
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

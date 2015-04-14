Exec['apt-update'] -> Package <| |>

Exec {
  logoutput => on_failure,
}

Package['fpm'] -> Package <| provider != gem |>

package { [
  'ruby',
  'ruby-dev',
  'rubygems',
]:
  ensure => latest,
}

package { [
  'fpm',
]:
  provider => gem,
  ensure   => latest,
}

file { '/etc/gemrc':
  ensure  => present,
  owner   => root,
  group   => root,
  content => 'gem: --no-rdoc --no-ri',
}

exec { 'apt-update':
  path    => ['/usr/bin'],
  command => 'apt-get update'
}

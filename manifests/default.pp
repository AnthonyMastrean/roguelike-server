Exec['apt-update'] -> Package <| |>

Exec {
  logoutput => on_failure,
}

package { [
  'ruby',
  'rubygems',
  'ruby-dev',
]:
  require => latest,
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

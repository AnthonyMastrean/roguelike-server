include fpm

exec { 'apt-update':
  path    => ['/usr/bin'],
  command => 'apt-get update'
}

Exec['apt-update'] -> Package <| |>

class { 'fpm_adom':
  require => Class['fpm::deps'],
}

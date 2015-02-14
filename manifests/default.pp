include fpm

exec { 'apt-update':
  path    => ['/usr/bin'],
  command => 'apt-get update'
}

Exec['apt-update'] -> Package <| |>

class { [
  'fpm_adom',
  'fpm_angband',
]:
  require => Class['fpm::deps'],
}

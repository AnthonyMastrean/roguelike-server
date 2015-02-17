include fpm

Exec['apt-update'] -> Package <| |>

Exec {
  logoutput => on_failure,
}

exec { 'apt-update':
  path    => ['/usr/bin'],
  command => 'apt-get update'
}

class { [
  'fpm_adom',
  'fpm_angband',
]:
  require => Class['fpm::deps'],
}

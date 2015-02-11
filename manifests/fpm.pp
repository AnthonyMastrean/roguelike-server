exec { 'apt-get update':
  path => ['/usr/bin'],
}

Exec['apt-get update'] -> Package<| |>

package { [
  'gcc',
  'rpm',
  'ruby-dev',
  'make',
  'tar',
  'wget']:
  ensure => latest,
}

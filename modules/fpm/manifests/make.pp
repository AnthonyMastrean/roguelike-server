define fpm::make(
  $source         = $title,
  $configure      = false,
  $label          = install,
  $configure_opts = undef,
  $creates        = undef,
) {

  if $configure {
    $make_require = Exec["configure-${source}"]

    exec { "configure-${source}":
      path    => [$source],
      cwd     => $source,
      command => "./configure ${configure_opts}",
    }
  }

  if $label {
    exec { "make-${label}-$source}":
      path    => ['/bin', '/usr/bin'],
      cwd     => $source,
      command => "make ${label}",
      require => Exec["make-${source}"],
    }
  }

  exec { "make-${source}":
    path    => ['/bin', '/usr/bin'],
    cwd     => $source,
    command => make,
    require => $make_require,
  }

}

define fpm::make(
  $source         = $title,
  $configure      = false,
  $configure_opts = undef,
  $label          = undef,
  $creates        = undef,
) {

  $configure_part = $configure ? {
    true  => './configure',
    false => '',
  }

  $make_part = $label ? {
    undef   => 'make',
    install => "make && make ${label}",
    default => "make ${label}",
  }

  $command = $configure ? {
    true  => "bash -c '${configure_part} && ${make_part}'",
    false => $make_part,
  }

  exec { "make-${source}":
    path    => ['/bin', '/usr/bin'],
    cwd     => $source,
    command => $command,
    creates => $creates,
  }

}

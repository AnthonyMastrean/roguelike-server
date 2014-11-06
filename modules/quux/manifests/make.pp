define quux::make(
  $source = $title,
  $configure = false,
  $label = install,
  $creates = undef,
) {

  include quux

  $configure_part = $configure ? {
    true => "./configure &&",
    false => "",
  }

  $make_part = $label ? {
    install => "make && make ${label}",
    default => "make ${label}",
  }

  exec { "make ${source}":
    path => ["/bin", "/usr/bin"],
    cwd => $source,
    command => "bash -c '${configure_part}${make_part}'",
    creates => $creates,
    require => Class["quux"],
  }

}

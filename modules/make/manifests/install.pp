define make::install(
  $source = $title,
  $configure = false,
  $label = install,
  $creates = undef,
) {

  include make

  $command = $configure ? {
    true => "./configure && make ${label}",
    false => "make ${label}",
  }

  exec { "make ${source}":
    path => ["/bin", "/usr/bin"],
    cwd => $source,
    command => "bash -c '${command}'",
    creates => $creates,
    require => Class["make"],
  }

}

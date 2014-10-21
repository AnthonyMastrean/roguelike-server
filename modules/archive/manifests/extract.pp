define archive::extract(
  $source,
  $target,
  $archive = gzip,
  $creates = undef,
  $pathname = undef,
  $strip_path = 0,
) {

  include archive

  exec { "extract ${source}":
    path => ["/bin"],
    command => "tar --extract --${archive} --file='${source}' --directory='${target}' --strip-components=${strip_path} ${pathname}",
    creates => $creates,
    require => Class["archive"],
  }

}

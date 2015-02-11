define fpm::extract(
  $source,
  $target,
  $archive    = gzip,
  $strip_path = 0,
  $creates    = undef,
  $pathname   = undef,
) {

  exec { "extract ${source}":
    path    => ['/bin'],
    command => "tar --extract --${archive} --file ${source} --directory ${target} --strip-components ${strip_path} ${pathname}",
    creates => $creates,
  }

}

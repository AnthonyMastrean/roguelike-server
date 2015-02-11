define fpm::fetch(
  $target,
  $url = $title,
) {

  exec { "wget ${url}":
    path    => ['/usr/bin'],
    command => "wget --output-document ${target} ${url}",
    creates => $target,
  }

}

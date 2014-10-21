define wget::fetch(
  $url = $title,
  $target,
) {

  include wget

  exec { "wget ${url}":
    path => ["/usr/bin"],
    command => "wget --output-document='${target}' ${url}",
    creates => $target,
    require => Class["wget"],
  }

}

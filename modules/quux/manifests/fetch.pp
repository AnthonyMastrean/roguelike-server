define quux::fetch(
  $url = $title,
  $target,
) {

  include quux

  exec { "wget ${url}":
    path => ["/usr/bin"],
    command => "wget --output-document='${target}' ${url}",
    creates => $target,
    require => Class["quux"],
  }

}

define roguelike::fetch(
  $url = $title,
  $target,
) {

  include roguelike

  exec { "wget ${url}":
    path => ["/usr/bin"],
    command => "wget --output-document='${target}' ${url}",
    creates => $target,
    require => Class["roguelike"],
  }

}

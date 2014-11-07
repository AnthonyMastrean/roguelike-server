exec { "apt-get update":
  path => ["/usr/bin"],
}

Exec["apt-get update"] -> Package<| |>

package { [
  "gcc", 
  "tar",
  "wget"]:
}

include fpm

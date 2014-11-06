exec { "apt-get update":
  path => ["/usr/bin"],
}

Exec["apt-get update"] -> Package<| |>

package { [
  "gcc", 
  "make", 
  "rpm",
  "tar",
  "wget"]:
}

file { ".gemrc":
  path => "/home/vagrant/.gemrc",
  content => "gem: --no-document\ngem: --no-rdoc --no-ri\n",
}

package { "ruby-dev":
  require => [File[".gemrc"], Package["make"]],
}

include fpm

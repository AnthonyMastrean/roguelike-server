Exec { 
	path => ["/bin", "/usr/bin"],
}

exec { "apt-get update":
}

package { [
  "make",
  "gcc",
  "wget"]:
  require => Exec["apt-get update"],
}

package { ["angband", "crawl"]:
}

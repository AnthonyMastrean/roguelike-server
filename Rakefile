PUPPET = FileList["manifests/*.pp", "modules/**/*.pp"]

task :default => [:lint]

desc "Check manifests & modules"
task :lint do
	system("puppet-lint --with-context --with-filename --fail-on-warnings --no-80chars-check #{PUPPET}") || fail()
end

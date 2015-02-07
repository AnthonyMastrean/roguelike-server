PUPPET = FileList.new("manifests/*.pp", "modules/**/*.pp")

task :default do
  system("puppet-lint #{PUPPET}") || fail()
end

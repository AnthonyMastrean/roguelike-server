task :default => [:validate, :lint]

task :validate do
  system("puppet parser validate **/*.pp") || fail()
end

task :lint do
  system("puppet-lint --fix --fail-on-warnings --relative --no-documentation-check --no-80chars-check **/*.pp") || fail()
end

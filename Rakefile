require "rake/clean"
require "puppet-lint/tasks/puppet-lint"

CLOBBER.include("**/*.tar.gz", "**/*.rpm")

task :default => [:validate, :lint]

PuppetLint::RakeTask.new :lint do |config|
  config.pattern = ["modules", "manifests"]
  config.disable_checks = ["documentation", "80chars"]
  config.fail_on_warnings = true
  config.with_context = true
  config.fix = true
end

task :validate do |task|
  system("puppet parser validate modules manifests") || fail()
end

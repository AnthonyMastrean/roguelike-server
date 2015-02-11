PUPPET     = FileList["manifests/*.pp", "modules/**/*.pp"]

LINT_RULES = ["--no-80chars-check", "--no-documentation-check"]
LINT_OPTS  = ["--with-context", "--with-filename"]

task :default => [:lint]

desc "Check manifests & modules"
task :lint, [:name] do |task, args|
	args.with_defaults(:name => "#{PUPPET}")
  system("puppet parser validate #{args.name}") || fail()
	system("puppet-lint --fail-on-warnings #{LINT_OPTS.join(" ")} #{LINT_RULES.join(" ")} #{args.name}") || fail()
end

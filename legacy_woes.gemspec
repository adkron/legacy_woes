# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{legacy_woes}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Amos King"]
  s.date = %q{2008-12-19}
  s.description = %q{Tools for legacy databases and ActiveRecord}
  s.email = %q{amos.l.king@gmail.com}
  s.extra_rdoc_files = ["lib/legacy_woes.rb", "README.rdoc"]
  s.files = ["lib/legacy_woes.rb", "Manifest", "MIT-LICENSE", "Rakefile", "README.rdoc", "legacy_woes.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/adkron/legacy_woes}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Legacy_woes", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{legacy_woes}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Tools for legacy databases and ActiveRecord}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

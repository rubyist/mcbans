Gem::Specification.new do |s|
  s.name        = "mcbans"
  s.version     = "1.0.0"
  s.date        = "2011-12-28"
  s.summary     = "Access the MCBans API from Ruby"
  s.email       = "scott@elitists.net"
  s.homepage    = "http://github.com/rubyist/mcbans"
  s.description = "Access the MCBans API from Ruby"
  s.has_rdoc    = false
  s.authors     = ["Scott Barron"]
  s.files       = ["Gemfile", "LICENSE", "README.md", "mcbans.gemspec"] + Dir['**/*.rb']
  s.add_dependency('json')
end

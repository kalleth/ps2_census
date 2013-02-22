Gem::Specification.new do |spec|
  spec.name                 = 'ps2_census'
  spec.version              = '0.0.0'
  spec.date                 = '2013-02-22'
  spec.summary              = 'A simple wrapper for the Planetside2 Census API'
  spec.authors              = ['Tom Russell']
  spec.email                = 'tom+github@cishub.co.uk'
  spec.files                = %w(README.md ps2_census.gemspec)
  spec.files               += Dir.glob("lib/**/*.rb")
  spec.add_dependency 'httparty', '~> 1.1'
end

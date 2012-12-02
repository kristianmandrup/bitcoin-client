# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'bitcoin/client/version'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "bitcoin-client"
  gem.homepage = "http://github.com/kristianmandrup/bitcoin-client"
  gem.license = "MIT"
  gem.summary = %Q{Bitcoin client for Rails}
  gem.description = %Q{Use Bitcoin in your Ruby OR Rails project}
  gem.email = "kmandrup@gmail.com"
  gem.authors = ["Kristian Mandrup"]
  gem.version = BitCoin::Client::VERSION
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  # File.exist?('VERSION') ? File.read('VERSION') : ""
  version = BitCoin::Client::VERSION 

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "bitcoin-client #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

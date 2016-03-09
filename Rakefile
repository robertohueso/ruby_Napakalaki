#!/usr/bin/env ruby
#encoding: utf-8

require 'rake/testtask'

Rake::TestTask.new do |t|
  #t.libs << "Monster.rb"
  t.test_files = FileList['tests/PruebaNapakalaki.rb']
  t.verbose = true
end

task :default => :test

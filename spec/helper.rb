$:.unshift File.expand_path('..', __FILE__)
$:.unshift File.expand_path('../../lib', __FILE__)
require 'simplecov'
SimpleCov.start
require 'epa'
require 'rspec'

require 'webmock/rspec'

def a_delete(path)
  a_request(:delete, '' + path)
end

def a_get(path)
  a_request(:get, '' + path)
end

def a_post(path)
  a_request(:post, '' + path)
end

def a_put(path)
  a_request(:put, '' + path)
end

def stub_delete(path)
  stub_request(:delete, '' + path)
end

def stub_get(path)
  stub_request(:get, '' + path)
end

def stub_post(path)
  stub_request(:post, '' + path)
end

def stub_put(path)
  stub_request(:put, '' + path)
end

def fixture_path
  File.expand_path('../fixtures', __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end

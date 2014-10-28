$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "..", "lib"))

Dir[File.join(File.dirname(__FILE__), "shared_examples", "*")].each { |f| require f }

require "namely"
require "vcr"
require "webmock/rspec"

TEST_ACCESS_TOKEN = "26e61d40dcb6a87aa3e9090e998fae92"
TEST_SUBDOMAIN = "sales14"

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
end

def classname
  described_class.name.split("::").last.downcase
end

def set_configuration!
  Namely.configure do |config|
    config.access_token = TEST_ACCESS_TOKEN
    config.subdomain = TEST_SUBDOMAIN
  end
end

def unset_configuration!
  Namely.configuration = nil
end

set_configuration!

require File.expand_path('../support/helpers', __FILE__)

describe 'cloudfoundry::cloudfoundry_nodes' do
  include Helpers::CloudfoundryTest

  it '#cf_mbus_url generates the expected output' do
    file('/tmp/cf_mbus_url-solo').must_match(%{^nats://nats:nats@localhost:4222/$})
  end
end

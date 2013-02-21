require File.expand_path('../support/helpers', __FILE__)

describe 'cloudfoundry::source_lwrp' do
  include Helpers::CloudfoundryTest

  it 'creates a checkout directory' do
    directory('/tmp/source_lwrp/dea').must_exist.with(:owner, 'cloudfoundry')
  end
end

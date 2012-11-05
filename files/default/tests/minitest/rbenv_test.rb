require File.expand_path('../support/helpers', __FILE__)

describe 'cloudfoundry::rbenv' do
  include Helpers::Cloudfoundry

  it 'installs a ruby binary' do
    file('/opt/rbenv/versions/1.9.2-p290/bin/ruby').must_exist
  end
end

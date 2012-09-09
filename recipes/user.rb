group node['cloudfoundry']['user'] do
  gid 1002
end

user node['cloudfoundry']['user'] do
  uid 1002
  gid 1002
  home "/home/#{node['cloudfoundry']['user']}"
  supports :manage_home => true
end

directory "/u" do
  owner "root"
end

group "cloudfoundry" do
  gid 10000
end

user "cloudfoundry" do
  uid 10000
  gid 10000
  home "/u/cloudfoundry"
  supports  :manage_home => true
end

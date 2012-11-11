class Chef
  module Mixin
    module CloudfoundryNodes
      include Chef::Mixin::Language # for search

      def cloud_controller_node
        if Chef::Config[:solo]
          Chef::Log.warn "cloud_controller_node is not meant for Chef Solo"
          return node
        end

        cf_role = node['cloudfoundry']['cloud_controller_role']

        if node.run_list.roles.include?(cf_role)
          return node
        end

        results = search(:node, "role:#{cf_role} AND chef_environment:#{node.chef_environment}")
        if results.size >= 1
          results[0]
        else
          Chef::Log.warn "cloud_controller_node found no cloud_controller"
          nil
        end
      end

      def cloud_controller_domain
        if Chef::Config[:solo]
          return node['cloudfoundry_cloud_controller']['server']['domain']
        end

        if cf_node = cloud_controller_node
          cf_node['cloudfoundry_cloud_controller']['server']['domain']
        else
          raise "cloud_controller_url found no cloud_controller"
        end
      end

      def cloud_controller_url
        if Chef::Config[:solo]
          return node['cloudfoundry_cloud_controller']['server']['api_uri']
        end

        if cf_node = cloud_controller_node
          return cf_node['cloudfoundry_cloud_controller']['server']['api_uri']
        else
          raise "cloud_controller_url found no cloud_controller"
        end
      end

      def cf_nats_server_node
        if Chef::Config[:solo]
          Chef::Log.warn "cf_nats_server_node is not meant for Chef Solo"
          return nil
        end

        cf_role = node['cloudfoundry']['nats_server_role']

        if node.run_list.roles.include?(cf_role)
          return node
        end

        results = search(:node, "role:#{cf_role} AND chef_environment:#{node.chef_environment}")
        if results.size >= 1
          results[0]
        else
          Chef::Log.warn "cf_nats_server_node found no nats_server"
          nil
        end
      end

      #
      # Look for the Nats Server to use.
      #
      # We will try a search first; if we find a suitable node, we will get the
      # attributes from there.
      # If that fails we will then look for attributes set on the current node.
      #
      def cf_mbus_url
        if !Chef::Config[:solo] && cf_node = cf_nats_server_node
          nats_attrs = cf_node['nats_server']
          host = cf_node.attribute?('cloud') ? cf_node['cloud']['local_ipv4'] : cf_node['ipaddress']
          return "#{nats_attrs['user']}:#{nats_attrs['password']}@#{host}:#{nats_attrs['port']}/"
        end

        nats_attrs = node['cloudfoundry']['nats_server']
        "nats://#{nats_attrs['user']}:#{nats_attrs['password']}@#{nats_attrs['host']}:#{nats_attrs['port']}/"
      end

      def cf_vcap_redis_node
        if Chef::Config[:solo]
          Chef::Log.warn "cf_vcap_redis_node is not meant for Chef Solo"
          return nil
        end

        cf_role = node['cloudfoundry']['vcap_redis_role']

        if node.run_list.roles.include?(cf_role)
          return node
        end

        results = search(:node, "role:#{cf_role} AND chef_environment:#{node.chef_environment}")
        if results.size >= 1
          results[0]
        else
          Chef::Log.warn "cf_vcap_redis_node found no vcap_redis"
          nil
        end
      end
    end
  end
end

Chef::Recipe.send(:include, Chef::Mixin::CloudfoundryNodes)
::Erubis::Context.send(:include, Chef::Mixin::CloudfoundryNodes)

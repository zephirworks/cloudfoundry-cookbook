class Chef
  module Mixin
    module Rbenv
      # stub to satisfy RecipeExt (library load order not guaranteed)
    end
  end
end

class Chef
  module Mixin
    module CloudfoundryCommon
      include Chef::Mixin::Rbenv

      def ruby_path(version)
        File.join(ruby_bin_path(version), "ruby")
      end

      def ruby_bin_path(version)
        File.join(rbenv_root, "versions", version, "bin")
      end
    end
  end
end

Chef::Recipe.send(:include, Chef::Mixin::CloudfoundryCommon)
::Erubis::Context.send(:include, Chef::Mixin::CloudfoundryCommon)

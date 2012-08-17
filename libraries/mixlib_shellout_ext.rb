require 'chef/shell_out'

class Chef
  # Increasing the default shellout timeout to an hour, because there's
  # a number of chef related things that can take longer than 10
  # minutes.
  #
  # Will only work on Chef <= 0.10.8. After that, Mixlib::ShellOut is
  # used.
  class ShellOut
    DEFAULT_READ_TIMEOUT=3600
  end
end

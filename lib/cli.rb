require 'thor'
require 'pebbles-productivity10x-switch_hosts'

module Pebbles
  module Productivity10x
    class CLI < Thor
      desc 'allow limited host', ''
      def allow
        SwitchHosts.new.allow
      end

      desc 'deny limited host', ''
      def deny
        SwitchHosts.new.deny
      end
    end
  end
end

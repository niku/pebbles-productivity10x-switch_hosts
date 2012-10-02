require "pebbles-productivity10x-switch_hosts/version"

require 'erb'
require 'fileutils'

module Pebbles
  module Productivity10x
    class SwitchHosts
      module Default
        HOSTS_PATH = if /windows/i =~ ENV['OS']
                       require 'win32/resolv'
                       Win32::Resolv.get_hosts_path
                     else
                       require 'resolv'
                       Resolv::Hosts::DefaultFileName
                     end
        ORIGINAL_EXTNAME = '.original'
        DENY_EXTNAME = '.deny'
        TEMPLATE = ERB.new(<<__EOS__)
127.0.0.1       <%= host %> # added by #{File.basename(__FILE__)}
__EOS__
        DENY_HOSTS = %w(
          twitter.com
          api.twitter.com
          facebook.com
          ja-jp.facebook.com
          www.facebook.com
          slashdot.jp
        )
      end

      def initialize opt = {}
        @hosts_path       = opt[:hosts_path]       || Default::HOSTS_PATH
        @original_extname = opt[:original_extname] || Default::ORIGINAL_EXTNAME
        @deny_extname     = opt[:deny_extname]     || Default::DENY_EXTNAME
        @template         = opt[:template]         || Default::TEMPLATE
      end

      def deny
        use(deny_file)
      end

      def allow
        use(original_file)
      end

      def hosts_file
        File.new(@hosts_path)
      end

      def original_file
        original_path = @hosts_path + @original_extname
        unless File.exist?(original_path)
          FileUtils.cp(hosts_file, original_path, preserve: true)
        end
        File.new original_path
      end

      def deny_file
        deny_path = @hosts_path + @deny_extname
        unless File.exist?(deny_path)
          FileUtils.cp original_file, deny_path, preserve: true
          File.open(deny_path, 'a') do |f|
            f << "\n"
            f << Default::DENY_HOSTS.map { |host| @template.result(binding) }.join
          end
        end
        File.new deny_path
      end

      private
      def use(source_file)
        FileUtils.cp(source_file, hosts_file, preserve: true)
      end
    end
  end
end

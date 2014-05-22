require_relative "../setup_functions"

namespace :host_setup do
  desc "Check if Agent Forwarding is enabled if not, sets it"
  task :setup_config do
    config_file = '/etc/ssh/ssh_config'
    if File.exists?(config_file)
      SetupFunctions::sed_search_and_replace(
          {'ForwardAgent no' => 'ForwardAgent yes', 'AllowAgentForwarding no' => 'AllowAgentForwarding yes'},
          '/etc/ssh/ssh_config'
      )
    else
      config_file = '/etc/ssh/ssh_config'
      content = <<-RUBY
        puts "Host *"
        puts "ForwardAgent yes"
        puts "AllowAgentForwarding yes"
      RUBY

      #File.open(config_file, "w+") do |f|
      #  f.write(content)
      #end
      # system "sudo " + content + " > " + config_file
      puts content
    end
  end
end
task :default => [:install_gems]

task :install_gems do
	system("sudo bundle install")
  system("eval `ssh-agent -s`")
  system("ssh-add")
end

task :default => [:setup]

task :setup do
	system("sudo bundle install")
  system("eval `ssh-agent -s`")
  system("ssh-add")
end

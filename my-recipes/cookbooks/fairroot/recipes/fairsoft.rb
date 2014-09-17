# variables
version = "jul14p3"
install_dir = "/opt/fairsoft"

directory install_dir do
  owner "vagrant"
  group "vagrant"
  mode 0755
  action :create
end

directory install_dir+"/"+version do
  owner "vagrant"
  group "vagrant"
  mode 00755
  action :create
end

git "/home/vagrant/fairsoft" do
  repository "https://github.com/FairRootGroup/FairSoft"
  revision "tags/" + version
  action :sync
  user "vagrant"
  group "vagrant"
end

bash "install_fairsoft" do
  user "vagrant"
  cwd "/home/vagrant/fairsoft"
  code <<-EOH
    ./configure.sh << EOF
    1
    1
    2
    2
    /opt/fairsoft/jul14p3
    2
    EOF
  EOH
end


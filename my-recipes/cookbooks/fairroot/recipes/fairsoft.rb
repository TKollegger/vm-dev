
directory node[:fairsoft][:dir] do
  owner "vagrant"
  group "vagrant"
  mode 0755
  action :create
end

directory node[:fairsoft][:dir]+"/"+node[:fairsoft][:version] do
  owner "vagrant"
  group "vagrant"
  mode 00755
  action :create
end

git node[:fairsoft][:src_dir]+ "/fairsoft" do
  repository "https://github.com/FairRootGroup/FairSoft"
  revision "tags/" + node[:fairsoft][:version]
  action :sync
  user "vagrant"
  group "vagrant"
end

template "config.input" do
  path node[:fairsoft][:src_dir]+"/fairsoft/config.input"
  source "config.input.erb"
  owner "vagrant"
  group "vagrant"
  mode "0644"
end

bash "install_fairsoft" do
  user "vagrant"
  cwd node[:fairsoft][:src_dir]+"/fairsoft"
  timeout 10800
  code <<-EOH
    ./configure.sh < config.input
  EOH
end

template "fairsoft.sh" do
    path "/etc/profile.d/fairsoft.sh"
    source "fairsoft.sh.erb"
    owner "root"
    group "root"
    mode "0644"
end

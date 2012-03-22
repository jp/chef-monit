package "monit"

if platform?("ubuntu")
  cookbook_file "/etc/default/monit" do
    source "monit.default"
    owner "root"
    group "root"
    mode 0644
  end
end

service_actions = value_for_platform(
  ["centos", "redhat", "suse", "fedora"] => {
    "default" => [ :enable ]
  },
  ["ubuntu", "debian"] => {
    "default" => [ :enable, :start ]
  }
)
service "monit" do
  action service_actions
  enabled true
  supports [:start, :restart, :stop]
end

config_directory = value_for_platform(
  ["centos", "redhat", "suse", "fedora"] => {
    "default" => "/etc/monit.d"
  },
  ["ubuntu", "debian"] => {
    "default" => "/etc/monit/conf.d"
  }
)
directory config_directory do
  owner  'root'
  group 'root'
  mode 0755
  action :create
  recursive true
end

template "/etc/monitrc" do
  owner "root"
  group "root"
  mode 0700
  source 'monitrc.erb'
  variables(
    :config_directory => config_directory
  )
  notifies :restart, resources(:service => "monit"), :delayed
end

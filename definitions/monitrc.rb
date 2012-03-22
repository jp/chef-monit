# reload      Reload monit so it notices the new service.  :delayed (default) or :immediately.
define :monitrc, :enable => true, :reload => :delayed, :source => nil do
  template_source = params[:source]
  template_source ||= "#{params[:name]}.conf.erb"
  
  config_directory = value_for_platform(
    ["centos", "redhat", "suse", "fedora"] => {
      "default" => "/etc/monit.d"
    },
    ["ubuntu", "debian"] => {
      "default" => "/etc/monit/conf.d"
    }
  )
  
  if params[:enable]
    template "#{config_directory}/#{params[:name]}.conf" do
      owner "root"
      group "root"
      mode 0644
      source template_source
      variables params
      notifies :restart, resources(:service => "monit"), params[:reload]
      action :create
    end
  else
    template "#{config_directory}/#{params[:name]}.conf" do
      action :delete
      notifies :restart, resources(:service => "monit"), params[:reload]
    end
  end
end
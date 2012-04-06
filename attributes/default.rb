default[:monit][:services]              = [] # List of items from the "monit" data bag that
                                             # describe services monitored by monit.
default[:monit][:logfile]               = "syslog facility log_daemon"

default[:monit][:notify][:enable]       = false
default[:monit][:notify][:email]        = "notify@example.com"

default[:monit][:httpd][:enable]        = true
default[:monit][:httpd][:port]          = 3737
default[:monit][:httpd][:address]       = "localhost"
default[:monit][:httpd][:allow]         = %w{localhost}

default[:monit][:poll_period]           = 60
default[:monit][:poll_start_delay]      = 120

default[:monit][:mail][:server]         = "localhost"
default[:monit][:mail][:port]           = "25"
default[:monit][:mail][:username]       = nil
default[:monit][:mail][:password]       = nil
default[:monit][:mail][:security]       = nil # SSLV2, SSLV3 or TLSV1
default[:monit][:mail][:checksum]       = nil # the server certificate checksum
default[:monit][:mail][:timeout]        = "5" # timeout in seconds for the mail server 
default[:monit][:mail][:use_node_fqdn]  = false # Use the Node's FQDN for "using hostname" 
default[:monit][:mail][:format][:subject] = "$SERVICE $EVENT"
default[:monit][:mail][:format][:from]    = "monit@example.com"
default[:monit][:mail][:format][:message]    = <<-EOS
Monit $ACTION $SERVICE at $DATE on $HOST: $DESCRIPTION.
Yours sincerely,
monit
EOS

default[:monit][:queue][:location]      = "/var/monit"  # base directory where events will be stored
default[:monit][:queue][:slots]         = nil           # limit the size of the queue

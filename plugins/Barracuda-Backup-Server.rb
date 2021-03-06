##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Barracuda-Backup-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-06-20
version "0.1"
description "Local inline Deduplication Backup Systems with available offsite Cloud Storage or site to site replication. - Homepage: https://www.barracudanetworks.com/ns/products/backup_overview.php"

# ShodanHQ results as at 2011-03-13 #
# 122 for BACKUP_LOCAL_LOCALE
# 122 for BACKUP_LOCAL_LOCALE=en_US

# Examples #
examples %w|
76.252.81.42
50.96.190.158
173.8.114.162
208.67.114.70
12.35.105.202
208.93.60.101
50.77.135.49
137.85.170.15
216.253.89.61
98.189.240.46
|

# Matches #
matches [

# /auth/signin/ # Logo HTML
{ :text=>'<div id="logo-wrapper"><a id="logo" href="http://www.barracudanetworks.com/ns/?a=backup_localui">Barracuda Networks</a></div>' },

# /auth/signin/ # Model Detection
{ :url=>"/auth/signin/", :model=>/<div id="label">Backup Server ([^\s^<]+)<\/div>/ },

# /include/cui/images/favicon.ico
{ :url=>"/include/cui/images/favicon.ico", :md5=>"de2b6edbf7930f5dd0ffe0528b2bbcf4" },

# Set-Cookie # BACKUP_LOCAL_LOCALE
{ :search=>"headers[set-cookie]", :regexp=>/BACKUP_LOCAL_LOCALE=/ },

]

end


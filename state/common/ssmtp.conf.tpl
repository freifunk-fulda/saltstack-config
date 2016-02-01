Root=noc@fulda.freifunk.net
Hostname={{ grains['fqdn'] }}
Mailhub={{ pillar['ssmtp']['server'] }}
FromLineOverride=yes
UseTLS=yes
AuthUser={{ pillar['ssmtp']['username'] }}
AuthPass={{ pillar['ssmtp']['password'] }}


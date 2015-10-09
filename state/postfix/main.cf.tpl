# THIS FILE IS CONTROLLED BY SALTSTACK
#
# minimal postfix configuration to allow sending mail out


smtpd_banner = $myhostname ESMTP $mail_name
biff = no

# appending .domain is the MUA's job.
append_dot_mydomain = no

readme_directory = no

# TLS parameters
smtpd_tls_cert_file=/etc/ssl/certs/ssl-cert-snakeoil.pem
smtpd_tls_key_file=/etc/ssl/private/ssl-cert-snakeoil.key
smtpd_use_tls=yes
smtpd_tls_session_cache_database = btree:${data_directory}/smtpd_scache
smtp_tls_session_cache_database = btree:${data_directory}/smtp_scache

# See /usr/share/doc/postfix/TLS_README.gz in the postfix-doc package for
# information on enabling SSL in the smtp client.

myorigin = /etc/mailname
myhostname = {{ grains['id'] }}.fulda.freifunk.net
alias_maps = hash:/etc/aliases
alias_database = hash:/etc/aliases
mydestination = {{ grains['id'] }}.fulda.freifunk.net, localhost.fulda.freifunk.net, localhost
mynetworks = 127.0.0.0/8 [::ffff:127.0.0.0]/104 [::1]/128 {{ pillar['hosts'][grains['id']]['ipv4']['public'] }}/32
mailbox_command = procmail -a "$EXTENSION"
mailbox_size_limit = 0
recipient_delimiter = +
inet_interfaces = loopback-only

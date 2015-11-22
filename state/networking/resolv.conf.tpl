# THIS FILE IS CONTROLLEB BY SALTSTACK!
#
{% if grains['id'].startswith('gw') -%}
# Gateways running bind prefer themselves as primary dns server,
# the dns master as secondary, and opendns as a fallback.

nameserver 127.0.0.1
nameserver 10.185.0.11
{%- else %}
# Use two gateway servers as primary and secondary dns, and
# opendns as a fallback.

nameserver 10.185.0.2
nameserver 10.185.0.3
{%- endif %}
nameserver 84.200.83.161

{% for owner, key in pillar['ssh']['authorized_keys'].items() %}
{{ key }} {{ owner }}
{% endfor %}

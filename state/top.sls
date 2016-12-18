base:
  '*':
    - apt
    - common.unwanted
    - common.tools
    - common.root
    - common.locales

    - salt
    - sysctl
    - rsyslog
    - logrotate
    - snmpd
    - postfix
    - ntp

    - ssh.server
    - ssh.client


  'roles:gateway':
    - match: grain
    - networking.gateway

  'roles:kvm':
    - match: grain
    - libvirt
    - ksm
    - networking.bridgeutils

  'srv1':
    - apache2.homepage
    - salt.master
    - mysql.server


authconfig:
  pkg.installed:
    - name: authconfig

# this needs to be updated to be more generic
authconfig_apply:
  cmd.run:
    - name: /usr/sbin/authconfig --enablesssd --enablesssdauth --disableldap --disableldapauth --enablemkhomedir --updateall
    - unless: /usr/bin/test "`/usr/sbin/authconfig --enablesssd --enablesssdauth --disableldap --disableldapauth --enablemkhomedir --updateall --test`" = "`authconfig --test`"


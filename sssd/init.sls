# Include :download:`map file <map.jinja>` of OS-specific package names and
# file paths. Values can be overridden using Pillar.
{% from "sssd/map.jinja" import sssd with context %}
{% set service = {True: 'running', False: 'dead'} %}

{% if grains['os_family'] == 'RedHat' %}
include:
  - sssd.authconfig
{% endif %}

sssd:
  pkg.installed:
    - name: {{ sssd.lookup.package }}

sssd_conf:
  file.managed:
    - name: {{ sssd.lookup.sssd_conf }}
    - mode: 600
    - source: salt://sssd/files/sssd.conf
    - template: jinja
    - context:
      config: {{ sssd.settings.sssd_conf }}
    - watch_in:
      - service: sssd_service
    - require:
      - pkg: sssd
{% if grains['os_family'] == 'RedHat' %}
    - require_in:
      - cmd: authconfig_apply
{% endif %}

{% if 'sssd' in sssd.settings %}
sssd_service:
  service.{{ service.get(sssd.settings.sssd) }}:
    - name: {{ sssd.lookup.service }}
    - enable: {{ sssd.settings.sssd }}
    - require:
      - file: sssd_conf
    - watch:
      - file: sssd_conf
{% endif %}


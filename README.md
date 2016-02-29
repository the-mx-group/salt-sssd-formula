================
sssd-formula
================

This formula installs and configures the System Security Services Daemon (sssd).

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``sssd``
------------

Installs the sssd package, configures the daemon, and (optionally) starts and enables the associated service.

**Note:** there is no default configuration for sssd, so a separate state for configuration seemed unnecessary. this state currently does it all, but can easily be broken out into "conf.sls" or some similarly named state if the need arises.


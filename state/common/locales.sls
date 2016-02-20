# generate locales and set the default one

us_locale:
  locale.present:
    - name: en_US.UTF-8

de_locale:
  locale.present:
    - name: de_DE.UTF-8

default_locale:
  locale.system:
    - name: en_US.UTF-8
    - require:
      - locale: us_locale


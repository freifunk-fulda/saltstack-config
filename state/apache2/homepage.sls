# Install dependencies for Websites
#
apache2.homepage:
  pkg.latest:
    - pkgs:
      - php5
      - php5-mysql
      - php5-gd
    - require:
      - pkg: apache2.common

include:
  - virtualenv

gunicorn-pip:
  pip.installed:
    - name: gunicorn
    - require:
      - virtualenv: virtualenv-pip-install
  pkg:
    - installed
    - name: gunicorn-pip

#Instalo python por si no está incluido con la imagen
python2:
  pkg:
    - installed
    - names:
      - python-dev
      - python

#instalo el módulo pip
pip:
  pkg:
    - installed
    - name: python-pip
    - require:
      - pkg: python2

#Si bien no es necesario, instalo el virtual env, porque consideré utilizarlo para correr la app flask
virtualenv:
  pip:
    - installed
    - require:
      - pkg: pip

#Comando para instalar supervisord, que sí lo utilizaremos para correr gunicorn
pip-install-supervisor:
  cmd.run:
    - name: sudo pip install supervisor

#instalacíon de gunicorn
pip-install-gunicorn:
  cmd.run:
    - name: sudo pip install gunicorn

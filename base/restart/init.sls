#detengo gunicorn dentro de supervisord
restart_deply__ejec_super_guni:
  cmd.run:
    - name: sudo supervisorctl stop gunicorn

#descargo de git
deploy_git:
  git.latest:
    - name: https://github.com/nachostein/stein_hw_flask.git
    - target: /usr/share/nginx/www/flask
    - rev: master
    - force: True
    - force_checkout: True
    - force_reset: True
    - always_fetch: True

#inicia gunicorn dentro de supervisord
restart_deploy_ejec_super_guni:
  cmd.run:
    - name: sudo supervisorctl start gunicorn


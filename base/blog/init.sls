#primero instalamos gi
git:
  pkg:
    - installed

#despues bajamos el repo
git-flask-blog:
  git.latest:
    - name: https://github.com/nachostein/stein_hw_flask.git
    - target: /usr/share/nginx/www/flask
    - rev: master
    - force: True
    - force_checkout: True
    - force_reset: True
    - always_fetch: True

#ahora ejecuto el gunicorn para que publique la app flask
#esto no funcionó porque al ejecutar gunicorn no podés analizar el stdrout
#nginx-build-pkg:
#  cmd.run:
#    - name: gunicorn blog:app > /dev/null 2>&1
#    - cwd: /usr/share/nginx/www/flask
#    - output_loglevel: quiet

#para que todo arranque bien es preciso reiniciar algunos servicios

#ejecuto un reinicio del nginx, primero stop y luego start.
blog_nginx_stop_forzado:
  cmd.run:
    - name: sudo service nginx stop

blog_nginx_inicio_forzado:
  cmd.run:
    - name: sudo service nginx start

#este comando re-lee los archivos de configuración
blog_read_upervisord:
  cmd.run:
    - name: sudo supervisorctl reread

#este comando actualiza la configuración
blog_update_supervisord:
  cmd.run:
    - name: sudo supervisorctl update

#inicia gunicorn dentro de supervisord
blog_ejec_super_guni:
  cmd.run:
    - name: sudo supervisorctl start gunicorn

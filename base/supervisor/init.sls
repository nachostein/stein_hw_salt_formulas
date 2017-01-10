#Primero instalo supervisord
supervisor:
  cmd.run:
    - name: sudo apt-get install supervisor --assume-yes

#luego le paso el archivo de configuración
blog:
  file.managed:
    - name: /etc/supervisor/conf.d/blog.conf
    - source: salt://supervisor/blog.conf

#ejecuto los comendos para que el supervisor tome los cambios y arranque gunicorn
#este comando re-lee los archivos de configuración
read_upervisord:
  cmd.run:
    - name: sudo supervisorctl reread

#este comando actualiza la configuración
update_supervisord:
  cmd.run:
    - name: sudo supervisorctl update

#inicia gunicorn dentro de supervisord
#ejec_super_guni:
#  cmd.run:
#    - name: sudo supervisorctl start gunicorn

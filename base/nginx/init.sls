#Instalo el webserver
nginx:
  pkg.installed: []
  service.running:
    - enable: True
    - require:
      - pkg: nginx
#  service:
#    - running
##lo de arriba lo compie de git de saltstack
#este era el original
#nginx: ## nombre del paquete
#  pkg: ## le dice a salt que ES un paquete
#    - installed ## le dice q lo tiene q instalar
#  service: ## le die q tambin es un servicio
#    - running ##le dice que se fije q está corriendo
#    - watch: # le dice q se fie si se actualiza q lo reinicie
#      - pkg: nginx ## idem
#      - file: /etc/nginx/nginx.conf ## idem
#esto es para asegurarse que el minion tenga el archivo de configuración de nginx correcto y lo tome desde el master
/etc/nginx/nginx.conf:
  file:
    - managed
    - source: salt://nginx/nginx.conf
    - user: root
    - group: root
    - mode: 644

#copio el archivo del site que indica que se vaa proxear la solicitud
/etc/nginx/sites-available/default:
  file:
    - managed
    - source: salt://nginx/default
    - user: root
    - group: root
    - mode: 644

#esto lo comento dado que al llamarse default,el link  ya existe
#nginx-linksite:
#  cmd.run:
#    - name: ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

#ejecuto un reinicio del nginx, primero stop y luego start.
nginx_stop_forzado:
  cmd.run:
    - name: sudo service nginx stop

nginx_inicio_forzado:
  cmd.run:
    - name: sudo service nginx start

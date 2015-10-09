<VirtualHost *:80>
        ServerName {{grains['id']}}.fulda.freifunk.net
        ServerAlias {{grains['id']}}.freifunk-fulda.de

        ServerAdmin noc@fulda.freifunk.net
        DocumentRoot /opt/fffd-keyupload/website
 
        WSGIDaemonProcess fffd-keyupload user=www-data group=www-data processes=1 threads=5
        WSGIScriptAlias /upload_key /opt/fffd-keyupload/keyupload/keyupload.py
 
        <Directory "/opt/fffd-keyupload/website">
                Options Indexes FollowSymLinks MultiViews
                AllowOverride None
                Require all granted
        </Directory>
 
        <Directory "/opt/fffd-keyupload/keyupload">
                WSGIProcessGroup fffd-keyupload
                WSGIApplicationGroup %{GLOBAL}
                Require all granted
        </Directory>
 
        LogLevel warn
        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>

<VirtualHost *:443>
        ServerName {{grains['id']}}.fulda.freifunk.net
        ServerAlias {{grains['id']}}.freifunk-fulda.de

        ServerAdmin noc@fulda.freifunk.net
        DocumentRoot /opt/fffd-keyupload/website
 
        <Directory "/opt/fffd-keyupload/website">
                Options None
                AllowOverride None
                Require all granted
        </Directory>
 
        LogLevel warn
        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined

        SSLEngine on
        SSLCertificateFile /etc/ssl/local/wildcard.fulda.freifunk.net.crt
        SSLCertificateKeyFile /etc/ssl/local/wildcard.fulda.freifunk.net.key
        SSLCertificateChainFile /etc/ssl/local/startcom.class2.server.crt
        SetEnvIf User-Agent ".*MSIE.*" nokeepalive ssl-unclean-shutdown

        <FilesMatch "\.(cgi|shtml|phtml|php)$">
                SSLOptions +StdEnvVars
        </FilesMatch>
        <Directory /usr/lib/cgi-bin>
                SSLOptions +StdEnvVars
        </Directory>

        BrowserMatch ".*MSIE.*" \
                nokeepalive ssl-unclean-shutdown \
                downgrade-1.0 force-response-1.0
</VirtualHost>

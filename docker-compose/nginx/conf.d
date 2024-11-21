server {
    listen 80;
    server_name localhost;

    root /var/www/public;
    index index.php index.html;

    # Handle PHP files via PHP-FPM
    location ~ \.php$ {
        include fastcgi_params;
        fastcgi_pass app:9000;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }

    # Serve static files from /dist
    location /dist/ {
        root /var/www/public;
        autoindex off;
    }

    # Static files
    location / {
        try_files $uri $uri/ /index.php;
    }
}
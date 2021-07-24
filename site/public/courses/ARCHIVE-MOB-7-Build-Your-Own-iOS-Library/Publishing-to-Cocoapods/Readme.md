# Publishing to CocoaPods


CocoaPods has a detailed guide on creating a cocoapod, follow the link and the instructions below to create a cocoapod:

[Creating a CocoaPod](https://guides.cocoapods.org/making/using-pod-lib-create)


To upload our library through CocoaPods, we have to use one of CocoaPod's software - `trunk`. Trunk lets us interface with the CocoaPod API to upload our library. Follow the instructions below

[Truck Instructions](https://guides.cocoapods.org/making/getting-setup-with-trunk)


## Publish to Cocoacontrols

Follow the instructions here to add your library to cocoacontrols:

[Publish to Cocoacontrols](https://www.cocoacontrols.com/controls/new)



server {
    listen 9000 default_server;
    listen [::]:9000 default_server ipv6only=on;

    root /usr/share/nginx/html;
    index index.html index.htm;

    # Make site accessible from http://localhost/
    server_name localhost;

    location / {
        # First attempt to serve request as file, then
        # as directory, then fall back to displaying a 404.
        try_files $uri $uri/ =404;
        # Uncomment to enable naxsi on this location
        # include /etc/nginx/naxsi.rules
    }

    location /api {
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $http_host;
        proxy_set_header X-NginX-Proxy true;

        rewrite ^/api/?(.*) /$1 break;

        proxy_pass http://api_node_js;
        proxy_redirect off;
    }
}

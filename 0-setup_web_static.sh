#!/usr/bin/env bash
 HEAD
# script that sets up web servers for the deployment of web_static
sudo apt-get update

# Script that sets up your web servers for the deployment of web_static

# Update and install Nginx
sudo apt-get -y update
 
sudo apt-get -y install nginx
sudo ufw allow 'Nginx HTTP'

<<<<<<< HEAD
sudo mkdir -p /data/
sudo mkdir -p /data/web_static/
sudo mkdir -p /data/web_static/releases/
sudo mkdir -p /data/web_static/shared/
sudo mkdir -p /data/web_static/releases/test/
sudo touch /data/web_static/releases/test/index.html
sudo echo "<html>
  <head>
  </head>
  <body>
    Holberton School
  </body>
</html>" | sudo tee /data/web_static/releases/test/index.html

sudo ln -s -f /data/web_static/releases/test/ /data/web_static/current

# Create required directories
sudo mkdir -p /data/web_static/shared/
sudo mkdir -p /data/web_static/releases/test/

# Create a test HTML file
echo "Holberton School" | sudo tee /data/web_static/releases/test/index.html > /dev/null

# Create symbolic link (replace if exists)
sudo ln -sf /data/web_static/releases/test/ /data/web_static/current


# Set ownership
sudo chown -R ubuntu:ubuntu /data/

 HEAD
sudo sed -i '/listen 80 default_server/a location /hbnb_static { alias /data/web_static/current/;}' /etc/nginx/sites-enabled/default

# Update Nginx config only once
sudo sed -i '44i \\n\tlocation /hbnb_static {\n\t\talias /data/web_static/current/;\n\t}' /etc/nginx/sites-available/default
 

# Restart Nginx
sudo service nginx restart


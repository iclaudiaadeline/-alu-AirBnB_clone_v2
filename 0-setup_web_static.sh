#!/usr/bin/env bash
# Sets up web servers for the deployment of web_static

# Exit on any error
set -e

# Install Nginx if not installed
sudo apt-get update -y
sudo apt-get install -y nginx

# Create necessary directories
sudo mkdir -p /data/web_static/releases/test/
sudo mkdir -p /data/web_static/shared/

# Create a fake HTML file
echo "<html>
  <head>
  </head>
  <body>
    Holberton School
  </body>
</html>" | sudo tee /data/web_static/releases/test/index.html > /dev/null

# Create or recreate the symbolic link
sudo ln -sf /data/web_static/releases/test/ /data/web_static/current

# Set ownership to ubuntu user and group
sudo chown -R ubuntu:ubuntu /data/

# Add Nginx config for /hbnb_static only if it doesn't exist
if ! grep -q "location /hbnb_static/" /etc/nginx/sites-available/default; then
  sudo sed -i '/server_name _;/a \\n\tlocation /hbnb_static/ {\n\t\talias /data/web_static/current/;\n\t}' /etc/nginx/sites-available/default
fi

# Restart Nginx
sudo service nginx restart


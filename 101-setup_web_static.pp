# setup web static - nginx

exec { 'configuring':
  command  => 'sudo apt-get -y;
  sudo apt-get update -y;
sudo apt-get -y install nginx;
sudo service nginx start;
sudo mkdir -p /data/web_static/shared/ && sudo mkdir -p /data/web_static/releases/test/
echo "Holberton School" | sudo tee /data/web_static/releases/test/index.html > /dev/null;
sudo ln -sf /data/web_static/releases/test/ /data/web_static/current;
sudo chown -R ubuntu:ubuntu /data/;
sudo sed -i \'24i \\n\tlocation /hbnb_static {\n\t\talias /data/web_static/current/;\n\t}\' /etc/nginx/sites-available/default && sudo service nginx restart',
  provider => shell,
}

#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install nginx -y

sudo systemctl start nginx
sudo systemctl enable nginx

echo "<h1> This side aditya tring to learn Terraform </h1>" | sudo tee /var/www/index.html


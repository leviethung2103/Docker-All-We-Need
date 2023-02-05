# Usage 
`jupyter_reverse_proxy.conf`
Forward the jupyter lab from another client machines to host machine by using the nginx

# How to install the nginx 
```
sudo apt install nginx
```

Reference: https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-20-04



## Server Configuration
- /etc/nginx: The Nginx configuration directory. All of the Nginx configuration files reside here.
- /etc/nginx/nginx.conf: The main Nginx configuration file. This can be modified to make changes to the Nginx global configuration.
/etc/nginx/sites-available/: The directory where per-site server blocks can be stored. Nginx will not use the configuration files found in this directory unless they are linked to the sites-enabled directory. Typically, all server block configuration is done in this directory, and then enabled by linking to the other directory.
- /etc/nginx/sites-enabled/: The directory where enabled per-site server blocks are stored. Typically, these are created by linking to configuration files found in the sites-available directory.
- /etc/nginx/snippets: This directory contains configuration fragments that can be included elsewhere in the Nginx configuration. Potentially repeatable configuration segments are good candidates for refactoring into snippets.
## Server Logs
- /var/log/nginx/access.log: Every request to your web server is recorded in this log file unless Nginx is configured to do otherwise.
- /var/log/nginx/error.log: Any Nginx errors will be recorded in this log.

# cent os installation

# install nginx if necessary
yum install nginx

# install perl dependencies
yum install perl-JSON-XS
yum install perl-Data-UUID

# Create folder to store files with nginx owner
mkdir -p /mnt/data/store && chown -R nginx:nginx /mnt/data/store

#
# Include perl modules in nginx.conf ( http section )
# https://nginx.ru/ru/docs/http/ngx_http_perl_module.html#perl_modules
#
# http {
#    ...
#    perl_modules /etc/nginx/lib;
#    perl_require filestore.pm;
#    ...
# }
#
# You can find example in nginx.conf or copy entire configuration into /etc/nginx/nginx.conf
#
# ----
#
# Copy filestore.conf to /etc/nginx/conf.d/filestore.conf
# Copy filestore.pm to /etc/nginx/lib/filestore.pm
#


%define _nginx_user msp-owner
%define _nginx_home /opt/msp/msp-nginx

%define _nginx_version 0.4.5
%define _nginx_release 0

%define _systemd_dir /usr/lib/systemd/system/

Name:       msp-nginx
Version:    %{_nginx_version}
Release:    %{_nginx_release}

Summary:    Nginx Closure
License:    The BSD 3-Clause License
Group:      Networking/Daemons
URL:        http://nginx-clojure.github.io

Source0:    nginx-clojure.tar.gz

Requires:   jre >= 1.8

BuildRoot:  %{_tmppath}/%{name}-%{version}-%{release}-build
BuildArch:  x86_64

%description
Nginx Closure

%prep
%setup -q -n nginx-clojure-%{version}

%build

%clean
rm -rf %{buildroot}

%install
install -d -m 755 %{buildroot}%{_nginx_home}/
cp -R * %{buildroot}%{_nginx_home}/

rm -rf %{buildroot}%{_nginx_home}/docs
rm -rf %{buildroot}%{_nginx_home}/licenses

rm -f %{buildroot}%{_nginx_home}/nginx-macosx
rm -f %{buildroot}%{_nginx_home}/nginx-win32.exe
rm -f %{buildroot}%{_nginx_home}/nginx-win64.exe
rm -f %{buildroot}%{_nginx_home}/nginx-linux-i586

mv %{buildroot}%{_nginx_home}/nginx-linux-x64 %{buildroot}%{_nginx_home}/nginx

sed -i 's/#user.*/user msp-owner;/' %{buildroot}%{_nginx_home}/conf/nginx.conf
sed -i 's/jvm_path.*/jvm_path \/usr\/lib\/jvm\/jre\/lib\/amd64\/server\/libjvm.so;/' %{buildroot}%{_nginx_home}/conf/nginx.conf
sed -i 's/jvm_classpath.*/jvm_classpath "jars\/nginx-clojure-0.4.5.jar:libs\/*";/' %{buildroot}%{_nginx_home}/conf/nginx.conf


# systemd service

install -d -m 755 %{buildroot}%{_systemd_dir}

cat > %{buildroot}%{_systemd_dir}/%{name}.service << EOL

[Unit]
Description=nginx clousure
After=network-online.target remote-fs.target nss-lookup.target
Wants=network-online.target

[Service]
Type=forking
WorkingDirectory=/opt/msp/msp-nginx
ExecStartPre=/opt/msp/msp-nginx/nginx -t
ExecStart=/opt/msp/msp-nginx/nginx
ExecReload=/opt/msp/msp-nginx/nginx -s reload
ExecStop=/opt/msp/msp-nginx/nginx -s stop
PrivateTmp=true
Restart=always
RestartSec=5s

[Install]
WantedBy=multi-user.target

EOL

%pre
getent group  %{_nginx_user} > /dev/null || groupadd -f -r %{_nginx_user}
getent passwd %{_nginx_user} > /dev/null || useradd -M -d %{_nginx_home} -g %{_nginx_user} -s /bin/nologin %{_nginx_user}

%post
/bin/systemctl daemon-reload

%preun

%postun

%files
%defattr(-,%{_nginx_user},%{_nginx_user},0770)
%dir %{_nginx_home}
%{_nginx_home}/nginx
%{_nginx_home}/contrib
%{_nginx_home}/html
%{_nginx_home}/jars
%{_nginx_home}/libs
%{_nginx_home}/logs
%{_nginx_home}/temp
%dir %{_nginx_home}/conf
%config(noreplace) %{_nginx_home}/conf/nginx.conf
%config %{_nginx_home}/conf/fastcgi.conf
%config %{_nginx_home}/conf/fastcgi_params
%config %{_nginx_home}/conf/koi-utf
%config %{_nginx_home}/conf/koi-win
%config %{_nginx_home}/conf/mime.types
%config %{_nginx_home}/conf/scgi_params
%config %{_nginx_home}/conf/uwsgi_params
%config %{_nginx_home}/conf/win-utf
%defattr(-,root,root)
%{_systemd_dir}/%{name}.service

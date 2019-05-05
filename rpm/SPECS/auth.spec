
%define _nginx_user msp-owner
%define _nginx_home /opt/msp/msp-nginx

%define _app_name    %{__app_name}
%define _app_version %{__app_version}
%define _app_archive %{__app_name}.jar
%define _app_binary  %{__app_binary}
# %define _app_config      nginx.conf
# %define _app_config_tmp  nginx.conf.auth.tmp

# ----

Name:       %{_app_name}
Version:    %{_app_version}
Release:    0

Summary:    msp/%{_app_name}/%{_app_version}
License:    msp/license

Requires:   jre >= 1.8
Requires:   msp-nginx >= 0.4.5

BuildRoot:  %{_tmppath}/%{_app_name}-%{version}-%{release}
BuildArch:  noarch

%description
msp/%{_app_name}/%{_app_version}

%prep

%build

%clean
rm -rf %{buildroot}

%install

#install -d -m 755 %{buildroot}%{_nginx_home}/conf
#install -m 755 %{_sourcedir}/%{_app_config} %{buildroot}%{_nginx_home}/conf/%{_app_config_tmp}

mv %{_sourcedir}/%{_app_binary} %{_sourcedir}/%{_app_archive}
install -d -m 755 %{buildroot}%{_nginx_home}/libs
install -m 755 %{_sourcedir}/%{_app_archive} %{buildroot}%{_nginx_home}/libs/%{_app_archive}

%pre

%post
case "$1" in
  1)
    #cp -f %{_nginx_home}/conf/%{_app_config_tmp} %{_nginx_home}/conf/%{_app_config}
    #chown -f %{_nginx_user}:%{_nginx_user} %{_nginx_home}/conf/%{_app_config}
  ;;
esac

service msp-nginx stop
service msp-nginx start

%preun

%postun

%files
%defattr(-,%{_nginx_user},%{_nginx_user},0770)
%{_nginx_home}/libs/%{_app_archive}
#%{_nginx_home}/conf/%{_app_config_tmp}


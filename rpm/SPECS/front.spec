
%define _nginx_user msp-owner
%define _nginx_home /opt/msp/msp-nginx/front
%define _msp_home /opt/msp

%define _app_name    %{__app_name}
%define _app_version %{__app_version}
%define _app_archive %{__app_name}.tar.gz
%define _app_home	 %{_msp_home}/%{_app_name}
%define _app_binary  %{__app_binary}

# ----

Name:       %{_app_name}
Version:    %{_app_version}
Release:    0

Summary:    msp/%{_app_name}/%{_app_version}
License:    msp/license

Source0:    %{_sourcedir}/%{_app_binary}

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

mkdir -p %{buildroot}%{_nginx_home}/%{_app_name}
tar -zxvf %{_sourcedir}/%{_app_binary} --directory %{buildroot}%{_nginx_home}/%{_app_name}
rm %{_sourcedir}/%{_app_binary}
install -d -m 755 %{buildroot}%{_nginx_home}/%{_app_name}
install -d -m 755 %{buildroot}%{_app_home}
install -d -m 755 %{_sourcedir} %{buildroot}%{_nginx_home}/%{_app_name}

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
%{_app_home}
%defattr(-,%{_nginx_user},%{_nginx_user},0770)
%{_nginx_home}/%{_app_name}
#%{_nginx_home}/conf/%{_app_config_tmp}


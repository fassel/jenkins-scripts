%define  debug_package %{nil}

# Owner
%define _msp_user msp-owner
%define _msp_home /opt/msp

# Application
%define _app_name 	  %{__app_name}
%define _app_raw_name %{__app_raw_name}
%define _app_version  %{__app_version}
%define _app_source   %{__app_path}
%define _app_home	  %{_msp_home}/%{_app_name}
%define _app_logs     /var/log/%{_app_name}
%define _app_conf     %{__app_config}
%define _app_schema   %{__app_schema}

# Systemd
%define _systemddir /usr/lib/systemd/system/

# Definition
Name:       %{_app_name}
Version:    %{_app_version}
Release:    0

Summary:    msp/%{_app_name}/%{_app_version}
License:    msp/license
Source0:    %{_app_source}

BuildRoot:  %{_tmppath}/%{name}-%{version}-%{release}
BuildArch:  x86_64

%description
msp/%{_app_name}/%{_app_version}

%prep
%setup -q -c %{_app_name}-%{app_version}

%build

%install
install -d -m 755 %{buildroot}%{_app_home}
cp -R * %{buildroot}%{_app_home}
# mv %{buildroot}%{_app_home}/%{_app_raw_name} %{buildroot}%{_app_home}/%{_app_name}
# mv %{buildroot}%{_app_home}/%{_app_conf} %{buildroot}%{_app_home}/%{_app_conf}.back

# Configure logging (Put logging in a custom location and link back)
install -d -m 755 %{buildroot}%{_app_logs}
cd %{buildroot}/%{_app_home}
ln -sf %{_app_logs} logs
cd -

# create systemd service
install -d -m 755 %{buildroot}%{_systemddir}

cat > %{buildroot}%{_systemddir}/%{_app_name}.service << EOL
[Unit]
Description=%{_app_name}
After=syslog.target network.target

[Service]
Type=simple
EnvironmentFile=-%{_app_home}/%{_app_conf}
ExecStart=%{_app_home}/%{_app_name}
StandardOutput=syslog
StandardError=syslog
SyslogIdentifier=%{_app_name}
Restart=always
RestartSec=3s

SuccessExitStatus=143
User=%{_msp_user}
Group=%{_msp_user}

[Install]
WantedBy=multi-user.target
EOL

# create rsyslog service
install -d -m 755 %{buildroot}%{_sysconfdir}/rsyslog.d

cat >  %{buildroot}%{_sysconfdir}/rsyslog.d/30-%{_app_name}.conf << EOL
if \$programname == '%{_app_name}' or \$syslogtag == '%{_app_name}' then /var/log/%{_app_name}/application.log
EOL
#& stop

# create logrotate service
install -d -m 755 %{buildroot}%{_sysconfdir}/logrotate.d

cat >  %{buildroot}%{_sysconfdir}/logrotate.d/%{_app_name} << EOL
/var/log/%{_app_name}/application.log {
  copytruncate
  daily
  rotate 7
  compress
  delaycompress
  missingok
  notifempty
}
EOL

# Executed before installation
%pre
case "$1" in
  1)
    # This is an initial install.
    rm -rf %{_app_home}
    getent group  %{_msp_user} > /dev/null || groupadd -f -r %{_msp_user}
	getent passwd %{_msp_user} > /dev/null || useradd -M -d %{_msp_home} -g %{_msp_user} -s /bin/nologin %{_msp_user}
  ;;
  2)
    # This is an upgrade.
  ;;
esac

# Executed after installation.
%post
systemctl daemon-reload
systemctl restart rsyslog

case "$1" in
  1)
    # This is an initial install.
	#install -g %{_msp_user} -o %{_msp_user} %{_app_home}/%{_app_conf}.back %{_app_home}/%{_app_conf}
  ;;
  2)
    # This is an upgrade.
    systemctl stop  %{_app_name}
    systemctl start %{_app_name}
  ;;
esac

# Executed before un-installation.
%preun
case "$1" in
  1)
    # This is an upgrade.
  ;;
  0)
    # This is an uninstallation.
    systemctl stop %{_app_name}
  ;;
esac

# Executed after un-installation.
%postun
case "$1" in
  1)
    # This is an upgrade
  ;;
  0)
    # This is an an uninstallation.
    rm -rf %{_app_home}
  ;;
esac

%clean
rm -rf %{buildroot}

%files
%defattr(-,%{_msp_user},%{_msp_user},0770)
%dir %{_msp_home}
%config(noreplace) %{_app_home}/%{_app_conf}
%{_app_home}
%{_app_logs}
%defattr(-,root,root)
%{_systemddir}/%{_app_name}.service
%{_sysconfdir}/rsyslog.d/30-%{_app_name}.conf
%{_sysconfdir}/logrotate.d/%{_app_name}

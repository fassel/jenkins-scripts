%define __jar_repack %{nil}

# Owner
%define _tomcat_user msp-owner

%define _app_name         msp-tomcat
%define _tomcat_home      /opt/msp/msp-tomcat
%define _tomcat_bin       /opt/msp/msp-tomcat/bin
%define _tomcat_conf      /opt/msp/msp-tomcat/conf
%define _tomcat_conf_apps /opt/msp/msp-tomcat/conf/apps
%define _tomcat_logs      /var/log/msp-tomcat

%define _tomcat_version 9.0.11
%define _tomcat_release 4

# Systemd
%define _systemddir /usr/lib/systemd/system/
%define _usrconfig  /usr/local/tomcat/conf
%define _app_source   %{__app_path}

Name:       msp-tomcat
Version:    %{_tomcat_version}
Release:    %{_tomcat_release}

Summary:    Apache Tomcat 9.0.11
License:    Apache Software License
Group:      Networking/Daemons
URL:        http://tomcat.apache.org/

Source0:    %{_app_source}/apache-tomcat.tar.gz
Source1:    %{_app_source}/tomcat-lib.tar.gz

Requires:   jre >= 1.8

BuildRoot:  %{_tmppath}/%{name}-%{version}-%{release}-build
BuildArch:  noarch

%description
Tomcat servlet container with speciefic shared libs

%prep
%setup -q -n apache-tomcat-%{version}
%setup -q -n apache-tomcat-%{version} -T -D -a 1

%build

%install

install -d -m 755 %{buildroot}%{_tomcat_home}
cp -R * %{buildroot}%{_tomcat_home}
mv %{buildroot}%{_tomcat_home}/*.jar %{buildroot}%{_tomcat_home}/lib

rm -rf %{buildroot}%{_tomcat_home}/webapps/host-manager
rm -rf %{buildroot}%{_tomcat_home}/webapps/examples
rm -rf %{buildroot}%{_tomcat_home}/webapps/docs
rm -rf %{buildroot}%{_tomcat_home}/webapps/ROOT

rm -f %{buildroot}%{_tomcat_home}/bin/*.bat
rm -f %{buildroot}%{_tomcat_home}/temp/safeToDelete.tmp

rm -f %{buildroot}%{_tomcat_home}/LICENSE
rm -f %{buildroot}%{_tomcat_home}/NOTICE
rm -f %{buildroot}%{_tomcat_home}/BUILDING.txt
rm -f %{buildroot}%{_tomcat_home}/CONTRIBUTING.md
rm -f %{buildroot}%{_tomcat_home}/README.md
rm -f %{buildroot}%{_tomcat_home}/RELEASE-NOTES
rm -f %{buildroot}%{_tomcat_home}/RUNNING.txt

install -m 755 %{_sourcedir}/server.xml           %{buildroot}%{_tomcat_conf}/server.xml
install -m 755 %{_sourcedir}/server-context.xml   %{buildroot}%{_tomcat_conf}/context.xml
install -m 755 %{_sourcedir}/server-users.xml     %{buildroot}%{_tomcat_conf}/tomcat-users.xml
install -m 755 %{_sourcedir}/server-setenv.sh     %{buildroot}%{_tomcat_bin}/setenv.sh

echo "" >> %{buildroot}%{_tomcat_conf}/catalina.properties
echo "PG_HOST=dummy_host"         >> %{buildroot}%{_tomcat_conf}/catalina.properties
echo "PG_DATABASE=dummy_database" >> %{buildroot}%{_tomcat_conf}/catalina.properties
echo "PG_USERNAME=dummy_username" >> %{buildroot}%{_tomcat_conf}/catalina.properties
echo "PG_PASSWORD=dummy_password" >> %{buildroot}%{_tomcat_conf}/catalina.properties

# Configure logging (Put logging in a custom location and link back)
rm -rf %{buildroot}/%{_tomcat_home}/logs
install -d -m 755 %{buildroot}%{_tomcat_logs}
cd %{buildroot}/%{_tomcat_home}
ln -sf %{_tomcat_logs} logs
cd -

# Create symlinc for external configuration
install -d -m 755 %{buildroot}%{_tomcat_conf_apps}
install -d -m 755 %{buildroot}%{_usrconfig}
cd %{buildroot}%{_usrconfig}
ln -sf %{_tomcat_conf_apps} apps
cd -

# Systemd service
install -d -m 755 %{buildroot}%{_systemddir}
cat > %{buildroot}%{_systemddir}/%{name}.service << EOL
[Unit]
Description=Apache Tomcat Web Application Container
After=syslog.target network.target

[Service]
Type=simple

Environment=JAVA_HOME=/usr/lib/jvm/jre
Environment=CATALINA_PID=/opt/msp/msp-tomcat/tomcat.pid
Environment=CATALINA_HOME=/opt/msp/msp-tomcat
Environment=CATALINE_BASE=/opt/msp/msp-tomcat
Environment='CATALINE_OPTS=-Xms512M -Xmx2048M -server -XX:+UseParallelGC'
Environment='JAVA_OPTS=-Djava.awt.haedless=true -Djava.security.egd=file:/dev/./urandom'

User=%{_tomcat_user}
Group=%{_tomcat_user}

ExecStart=%{_tomcat_bin}/catalina.sh run > %{_tomcat_logs}/catalina.out 2>&1
RestartSec=5s
Restart=always
StandardOutput=syslog
StandardError=syslog
SyslogIdentifier=%{_app_name}
SuccessExitStatus=143

[Install]
WantedBy=multi-user.target
EOL

# create rsyslog service
install -d -m 755 %{buildroot}%{_sysconfdir}/rsyslog.d

cat >  %{buildroot}%{_sysconfdir}/rsyslog.d/30-%{_app_name}.conf << EOL
if \$programname == '%{_app_name}' or \$syslogtag == '%{_app_name}' then %{_tomcat_logs}/application.log
EOL

# create logrotate service
install -d -m 755 %{buildroot}%{_sysconfdir}/logrotate.d
cat >  %{buildroot}%{_sysconfdir}/logrotate.d/%{name} << EOL
%{_tomcat_logs}/application.log {
  copytruncate
  daily
  rotate 7
  compress
  delaycompress
  missingok
  notifempty
}
EOL

%clean
rm -rf %{buildroot}

# Executed before installation
%pre
case "$1" in
  1)
    # This is an initial install.
    rm -rf %{_tomcat_home}
    getent group  %{_tomcat_user} > /dev/null || groupadd -f -r %{_tomcat_user}
	getent passwd %{_tomcat_user} > /dev/null || useradd -M -d %{_tomcat_user} -g %{_tomcat_user} -s /bin/nologin %{_tomcat_user}
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
  ;;
  2)
    # This is an upgrade.
    systemctl stop  msp-tomcat
    systemctl start msp-tomcat
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
    systemctl stop msp-tomcat
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
    rm -rf %{_tomcat_home}
  ;;
esac

%files
%defattr(-,%{_tomcat_user},%{_tomcat_user},0770)
%dir %{_tomcat_home}
%{_tomcat_home}/bin
%{_tomcat_home}/lib
%{_tomcat_home}/logs
%{_tomcat_home}/temp
%{_tomcat_home}/work
%{_tomcat_home}/webapps
%{_tomcat_logs}
%{_usrconfig}
%config(noreplace) %{_tomcat_conf}
%defattr(-,root,root)
%{_systemddir}/%{name}.service
%{_sysconfdir}/rsyslog.d/30-%{_app_name}.conf
%{_sysconfdir}/logrotate.d/%{name}

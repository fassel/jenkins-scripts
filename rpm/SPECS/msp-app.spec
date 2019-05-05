
# Owner
%define _tomcat_user msp-owner
%define _tomcat_home /opt/msp/msp-tomcat
%define _msp_home /opt/msp
%define _tomcat_conf /opt/msp/msp-tomcat/conf/apps

# Application
%define _app_name     %{__app_name}
%define _app_raw_name %{__app_raw_name}
%define _app_version  %{__app_version}
%define _app_binary   %{__app_binary}
%define _app_config   %{__app_config}
%define _app_schema   %{__app_schema}
%define _app_context  %{__app_context}
%define _app_home	  %{_msp_home}/%{_app_name}

# Definition
Name:       %{_app_name}
Version:    %{_app_version}
Release:    0

Summary:    msp/%{_app_name}/%{_app_version}
License:    msp/license
Requires:   msp-tomcat >= 8.5.31
Requires:   wget

BuildRoot:  %{_tmppath}/%{_app_name}-%{version}-%{release}
BuildArch:  noarch

%description
msp/%{_app_name}/%{_app_version}

%prep

%build

%clean
rm -rf %{buildroot}

%install
install -d -m 755 %{buildroot}%{_tomcat_home}/webapps
install -d -m 755 %{buildroot}%{_app_home}
install -m 755 %{_sourcedir}/%{_app_binary} %{buildroot}%{_tomcat_home}/webapps/%{_app_binary}
mv %{buildroot}%{_tomcat_home}/webapps/%{_app_binary} %{buildroot}%{_tomcat_home}/webapps/%{_app_raw_name}

install -d -m 755 %{buildroot}%{_tomcat_conf}
#cat > %{buildroot}%{_tomcat_conf}/%{_app_config} << EOL
#spring.jpa.properties.hibernate.default_schema: %{_app_schema}
#spring.datasource.jndi-name: java:comp/env/jdbc/msp
#
#liquibase:
#  url: "jdbc:postgresql://\${PG_HOST}:5432/\${PG_DATABASE}?currentSchema=%{_app_schema},public&connectTimeout=120"
#  user: \${PG_USERNAME}
#  password: \${PG_PASSWORD}
#EOL

install -d -m 755 %{buildroot}/opt/msp/%{_app_name}
cat > %{buildroot}/opt/msp/%{_app_name}/%{_app_config} << EOL
spring.jpa.properties.hibernate.default_schema: %{_app_schema}
spring.datasource.jndi-name: java:comp/env/jdbc/msp

liquibase:
  url: "jdbc:postgresql://\${PG_HOST}:5432/\${PG_DATABASE}?currentSchema=%{_app_schema},public&connectTimeout=120"
  user: \${PG_USERNAME}
  password: \${PG_PASSWORD}
EOL

%post
ln -sf /opt/msp/%{_app_name}/%{_app_config} %{_tomcat_conf}/%{_app_config}

%pre
wget http://admin:1q2w3e4r!@127.0.0.1:8080/manager/text/stop?path=%{_app_context} -O - -q | true
wget http://admin:1q2w3e4r!@127.0.0.1:8080/manager/text/undeploy?path=%{_app_context} -O - -q | true

%postun
case "$1" in
  1)
    # This is an upgrade
  ;;
  0)
    # This is an an uninstallation.
    wget http://admin:1q2w3e4r!@127.0.0.1:8080/manager/text/stop?path=%{_app_context} -O - -q | true
    wget http://admin:1q2w3e4r!@127.0.0.1:8080/manager/text/undeploy?path=%{_app_context} -O - -q | true
  ;;
esac

%files
%defattr(-,%{_tomcat_user},%{_tomcat_user},0770)
%{_app_home}
%{_tomcat_home}/webapps/%{_app_raw_name}
%config(noreplace) /opt/msp/%{_app_name}/%{_app_config}

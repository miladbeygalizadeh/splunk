@echo off

echo [ + ] Installing Sysmon64 ...
"%~dp0Sysmon64.exe" -accepteula -n -i "%~dp0Sysmonconfig.xml"

echo [ + ] Installing Splunk Forwarder ...

"C:\Windows\System32\msiexec.exe" /i "%~dp0splunkforwarder-9.0.0-6818ac46f2ec-x64-release.msi"  AGREETOLICENSE="Yes" INSTALLDIR="%Programfiles%\SplunkUniversalForwarder" SPLUNKD_PORT="8089" WEB_PORT="8000"  WINEVENTLOG_APP_ENABLE="0" WINEVENTLOG_SEC_ENABLE="0"  WINEVENTLOG_SYS_ENABLE="0" WINEVENTLOG_FWD_ENABLE="1" WINEVENTLOG_SET_ENABLE="0" DEPLOYMENT_SERVER="host:port" RECEIVING_INDEXER="<host:port>" LAUNCHSPLUNK="1" INSTALL_SHORTCUT="0" SPLUNKUSERNAME="splunk" SPLUNKPASSWORD="!QAZ2wsx0okm" /quiet

echo [ + ] restarting Splunk Forwarder Service ...
net stop SplunkForwarder

net start SplunkForwarder
echo [ + ] Installation has been completed

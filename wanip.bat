@echo off
:: This is a Script to get Public Ip Address of system

:CheckInternet
  ping -n 1 8.8.8.8 > nullwanip
  if not %errorlevel% == 0 (echo [-] Check Your Internet Connection && exit /b 1)

:Getwanip
  setlocal
  curl -4 icanhazip.com 1> tmpwanip 2> nullwanip
  set /p ipv4= < tmpwanip
  curl -6 icanhazip.com 1> tmpwanip 2> nullwanip
  set /p ipv6= < tmpwanip
  del tmpwanip
  del nullwanip
  echo.
  echo  ##################
  echo   WAN IP INFO
  echo  - Using Curl
  echo  [+] ipv4 : %ipv4%
  echo  [+] ipv6 : %ipv6%
  endlocal
  exit /b 0



@ECHO off

SET serviceTitle="Apache 2.4"
SET serviceName="Apache2.4"
SET pathX86="C:\Program Files (x86)\Apache24\bin\httpd"
SET pathX64="C:\Program Files\Apache24\bin\httpd"
SET default=64


WMIC service WHERE name=%serviceName% GET State | FIND /I /N "Running" >NUL

IF NOT ERRORLEVEL 1 (
    REM Current %serviceName% is running.
    GOTO LaunchApacheOpposite
) ELSE (
    REM Current %serviceName% is not running
    GOTO LaunchApacheDefault
)


:LaunchApacheOpposite
WMIC service WHERE name=%serviceName% GET PathName | FIND /I /N %pathX86% >NUL

IF NOT ERRORLEVEL 1 (
    REM Current %serviceName% is ApacheX86
    GOTO LaunchApacheX64
)

WMIC service WHERE name=%serviceName% GET PathName | FIND /I /N %pathX64% >NUL

IF NOT ERRORLEVEL 1 (
    REM Current %serviceName% is ApacheX64
    GOTO LaunchApacheX86
)

GOTO LaunchApacheDefault


:LaunchApacheDefault
IF %default% EQU 64 (
    GOTO LaunchApacheX64
) ELSE (
    GOTO LaunchApacheX86
)


:LaunchApacheX86
SET running=86

NET STOP %serviceTitle%
%pathX64% -k uninstall -n %serviceTitle%
%pathX86% -k install -n %serviceTitle%
GOTO StartService


:LaunchApacheX64
SET running=64

NET STOP %serviceTitle%
%pathX86% -k uninstall -n %serviceTitle%
%pathX64% -k install -n %serviceTitle%
GOTO StartService


:StartService
NET START %serviceTitle%

ECHO.
ECHO.
ECHO %serviceTitle% x%running% is now running.
GOTO End


:End
PAUSE

echo off

# REM Place this file and server.STOP.bat in your 'database' subfolder
# REM Set hsqldb=2 below when running HSQLDB 2.x, and set the jarpath under :CONTINUE
# REM below to reflect the full path to hsqldb.jar

set hsqldb=2

# REM Edit javapath= below to reflect the sub­path of your Java.exe file...
# REM Edit jarpath= below to reflect the sub­path of your hsqldb.jar file...

set javapath=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
set jarpath=/Volumes/digiVault/__Dedicated Split DatabaseREM 
set jarpath=OpenOffice.org 3\Basis\program\classes\hsqldb.jar

# REM set jarpath=LibreOffice 4\program\classes\hsqldb.jar

IF EXIST "%PROGRAMFILES(X86)%" GOTO Win64

:Win32

set javapath=%PROGRAMFILES%\%javapath%
set jarpath=%PROGRAMFILES%\%jarpath%

GOTO CONTINUE

:Win64

set javapath=%PROGRAMFILES(X86)%\%javapath%
set jarpath=%PROGRAMFILES(X86)%\%jarpath%

:CONTINUE

# Set hsqldb=2 above when running HSQLDB 2.x, and set the jarpath below to reflect the
# full path to hsqldb.jar

IF %hsqldb%==1 GOTO FINISH

set jarpath=/Volumes/digiVault/__Dedicated Split Database

:FINISH

# REM Edit the Base front­end .odb name below as necessary
start mydb.server.odb

# REM Edit the database name...currently "mydb"...within the server startup string below as necessary
# REM remove ';shutdown=true' from the startup string below in multi­user environments to avoid
# REM automatic shutdown upon closing all Base sessions
$javapath$ ­cp $jarpath$ org.hsqldb.Server ­database.0

file:mydb_wizard.odb

set hsqldb.default_table_type=cached

# REM pause

exit
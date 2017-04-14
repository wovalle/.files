@ECHO off
FOR /f "delims=" %%a in ('POWERCFG -GETACTIVESCHEME') DO @SET _CURRENT_POWER_SCHEME="%%a"

IF %_CURRENT_POWER_SCHEME%=="Power Scheme GUID: 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c  (High performance)" POWERCFG /SETACTIVE "90cada9f-f611-4378-9149-f11677883dd5"
IF NOT %_CURRENT_POWER_SCHEME%=="Power Scheme GUID: 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c  (High performance)" POWERCFG /SETACTIVE "8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c"
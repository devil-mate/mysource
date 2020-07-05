@echo off
SETLOCAL EnableDelayedExpansion

SET "DESIRED_MASTER_URI=%GAZEBO_MASTER_URI%"
SET "DESIRED_MODEL_DATABASE_URI=%GAZEBO_MODEL_DATABASE_URI%"

SET "FINAL=%*"

FOR /F "tokens=* USEBACKQ" %%F IN (`catkin_find --first-only gazebo_ros_paths_plugin.dll`) DO (
SET "FINAL=%FINAL% -g "%%F""
)

FOR /F "tokens=* USEBACKQ" %%F IN (`catkin_find --first-only gazebo_ros_api_plugin.dll`) DO (
SET "FINAL=%FINAL% -g "%%F""
)

SET GAZEBO_SETUP=
FOR /F "tokens=* USEBACKQ" %%F IN (`pkg-config --variable=prefix gazebo`) DO (
SET "GAZEBO_SETUP=%%F/share/gazebo/setup.bat"
)

SET REMAPPINGS_OUTPUT=
SET OPTIONS_OUTPUT=
call :RELOCATE_REMAPPINGS %FINAL%

ENDLOCAL & SET "GAZEBO_OPTIONS=%OPTIONS_OUTPUT%%REMAPPINGS_OUTPUT%" & SET "GAZEBO_SETUP=%GAZEBO_SETUP%" & SET "DESIRED_MASTER_URI=%DESIRED_MASTER_URI%" & SET "DESIRED_MODEL_DATABASE_URI=%DESIRED_MODEL_DATABASE_URI%"

CALL %GAZEBO_SETUP%
SET "GAZEBO_MASTER_URI=%DESIRED_MASTER_URI%"
SET "GAZEBO_MODEL_DATABASE_URI=%DESIRED_MODEL_DATABASE_URI%"
gzserver %GAZEBO_OPTIONS%

GOTO :EOF

:RELOCATE_REMAPPINGS
FOR /F "tokens=1*" %%A IN ("%*") DO (
    SET _REMAPPING=0
    SET _TEMP_VAR=%%A
    FOR %%A IN (!_TEMP_VAR!) DO (
        IF NOT "%%A"=="!_TEMP_VAR!" SET _REMAPPING=1
    )
    IF !_REMAPPING!==1 (
        SET "REMAPPINGS_OUTPUT=!REMAPPINGS_OUTPUT! !_TEMP_VAR!"
    ) ELSE (
        SET "OPTIONS_OUTPUT=!OPTIONS_OUTPUT! !_TEMP_VAR!"
    )
    IF NOT "%%B"=="" call :RELOCATE_REMAPPINGS %%B
)
EXIT /B

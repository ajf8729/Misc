REM Author: Anthony Fontanez
REM Email: ajfrcc@gmail.com
REM Version: 1.0
REM Description: Copies CLEANMGR files from WINSXS folder to System32 so it can be used without installing the Desktop Experience role on servers
@echo off
copy %WINDIR%\winsxs\amd64_microsoft-windows-cleanmgr_31bf3856ad364e35_6.1.7600.16385_none_c9392808773cd7da\cleanmgr.exe %WINDIR%\System32\
copy %WINDIR%\winsxs\amd64_microsoft-windows-cleanmgr.resources_31bf3856ad364e35_6.1.7600.16385_en-us_b9cb6194b257cc63\cleanmgr.exe.mui %WINDIR%\System32\en-US\
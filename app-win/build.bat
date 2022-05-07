@echo off
cd /D "%~dp0\src"
rmdir /s /q ..\bin
rmdir /s /q build
rmdir /s /q dist
echo ==^> Using pyinstaller to make executable
python -m ensurepip
python -m pip install pyinstaller pywin32 icoextract
python -m PyInstaller package.spec --noconfirm
echo ==^> Copying to setup directory
mkdir ..\bin
Xcopy /E /I /F /Y dist\cassowary ..\bin\cassowary
Xcopy /Y /I /F /Y extras\* ..\bin\
del ..\bin\app.svg
rmdir /s /q build
rmdir /s /q dist
cd ..\
echo ==^> Done...

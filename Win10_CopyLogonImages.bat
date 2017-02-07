@echo off
REM MIT License
REM 
REM Copyright (c) 2017 Rolf Wenger (splitbrainCH)
REM 
REM Permission is hereby granted, free of charge, to any person obtaining a copy
REM of this software and associated documentation files (the "Software"), to deal
REM in the Software without restriction, including without limitation the rights
REM to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
REM copies of the Software, and to permit persons to whom the Software is
REM furnished to do so, subject to the following conditions:
REM 
REM The above copyright notice and this permission notice shall be included in all
REM copies or substantial portions of the Software.
REM 
REM THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
REM IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
REM FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
REM AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
REM LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
REM OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
REM SOFTWARE.
REM *******************************************************************************
REM This script copies all the nice Windows 10 Login-Wallpapers to
REM a directory of your choice. It only takes files bigger than
REM 200'000 Bytes (default) because smaller ones are not images.
REM
REM Just run it every day and it will copy new images if available.
REM
REM v20170206 initial Script
REM v20170207 Change some hardcoded paths to variables

echo Welcome to the copying of nice Windows 10 wallpapers...

set "$limit=200000"
set "$source=%localappdata%\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets"
set "$dest=C:\Users\rw\Dropbox\SDAG\sdag_wallpaper"
echo cd into %$source%
cd %$source%

echo Search for files bigger than %$limit% bytes...
for /f %%a in ('dir /a-d/b') do (
	if not %%~za leq %$Limit% (
REM		echo %%~nxa Bigger than %$Limit% --^> %%~za Bytes
		If Not Exist "%$dest%\%%~nxa.jpg" (
			echo Found one! Copy to %$dest%
			copy %%~nxa "%$dest%\%%~nxa.jpg"
		)
	)
)

echo Done! Press any key to exit!
pause

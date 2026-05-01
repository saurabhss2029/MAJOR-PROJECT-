@echo off
title MindCare AI Frontend
echo Starting Frontend on Port 3001...
echo.
cd /d "%~dp0"
set PORT=3001
npm start
pause

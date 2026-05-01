@echo off
echo ============================================
echo Starting MindCare AI Application
echo ============================================
echo.

REM Check if python is installed
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Python is not installed or not in PATH
    pause
    exit /b 1
)

REM Check if npm is installed
npm --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: npm is not installed or not in PATH
    pause
    exit /b 1
)

echo Starting Backend on Port 8000...
echo.
start "MindCare Backend" cmd /k "cd /d %~dp0backend && python -m uvicorn app.main:app --reload --port 8000"

timeout /t 3 /nobreak

echo Starting Frontend on Port 3001...
echo.
start "MindCare Frontend" cmd /k "cd /d %~dp0frontend && npm start"

echo.
echo ============================================
echo Backend: http://localhost:8000
echo Frontend: http://localhost:3001
echo ============================================
pause

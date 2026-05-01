@echo off
cls
echo.
echo ============================================================
echo   MindCare AI - Child Mental Health Prediction System
echo   Made by Team PCS26-22
echo ============================================================
echo.

REM Check Python
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Python is not installed
    pause
    exit /b 1
)

REM Check npm
npm --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: npm is not installed
    pause
    exit /b 1
)

echo ✓ Python and npm are installed
echo.
echo Starting MindCare AI...
echo.

REM Start backend
echo [1/2] Starting Backend on Port 8000...
start "MindCare Backend" cmd /k "cd /d %~dp0backend && .venv\Scripts\activate && python -m uvicorn app.main:app --reload --port 8000"

timeout /t 3 /nobreak

REM Start frontend
echo [2/2] Starting Frontend on Port 3001...
start "MindCare Frontend" cmd /k "cd /d %~dp0frontend && npm start"

echo.
echo ============================================================
echo   ✓ Application is starting...
echo.
echo   Backend:  http://localhost:8000
echo   Frontend: http://localhost:3001
echo.
echo   Opening browser in 5 seconds...
echo ============================================================
echo.

timeout /t 5 /nobreak

REM Open browser
start http://localhost:3001

echo Done! The application is now running.
pause

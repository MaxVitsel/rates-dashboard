@echo off
rem Запуск дашборда курсов на своём компьютере (Windows).
rem Двойной клик по файлу в проводнике.
cd /d "%~dp0"
set PORT=8000

where python >nul 2>&1 && set PY=python
if not defined PY (where py >nul 2>&1 && set PY=py)
if not defined PY (
  echo Не найден Python. Установите его с https://www.python.org/downloads/
  echo и поставьте галочку "Add Python to PATH" при установке.
  pause
  exit /b 1
)

echo Дашборд: http://localhost:%PORT%
echo Остановить - Ctrl+C или закройте это окно.
echo.
start "" "http://localhost:%PORT%"
%PY% -m http.server %PORT%

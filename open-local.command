#!/usr/bin/env bash
# Запуск дашборда курсов на своём компьютере (macOS / Linux).
# Двойной клик по файлу в Finder — или ./open-local.command в терминале.
set -e
cd "$(dirname "$0")"

PORT=8000
while lsof -i ":$PORT" >/dev/null 2>&1; do PORT=$((PORT+1)); done

URL="http://localhost:$PORT"
echo "Дашборд: $URL"
echo "С телефона в той же сети Wi-Fi:"
for ip in $(ipconfig getifaddr en0 2>/dev/null; hostname -I 2>/dev/null); do
  echo "   http://$ip:$PORT"
done
echo
echo "Остановить — Ctrl+C или просто закройте это окно."
echo

( sleep 1; open "$URL" 2>/dev/null || xdg-open "$URL" 2>/dev/null || true ) &
python3 -m http.server "$PORT"

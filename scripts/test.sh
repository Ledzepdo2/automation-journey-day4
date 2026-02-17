#!/usr/bin/env bash
set -euo pipefail

WEB_URL="http://localhost:8083"

echo "[TEST] waiting for web to respond on $WEB_URL ..."
for i in {1..20}; do
  if curl -fsS "$WEB_URL" > /dev/null; then
    echo "[OK] web responding"
    break
  fi
  sleep 0.2
done

# Validación final (si no responde, falla)
curl -fsS "$WEB_URL" > /dev/null

echo "[TEST] redis should respond..."
REDIS_ID="$(docker compose ps -q redis)"
docker exec -i "$REDIS_ID" redis-cli ping | grep -q PONG
echo "[OK] redis responding"

echo "[ALL OK]"

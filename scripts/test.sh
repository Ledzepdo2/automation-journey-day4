#!/usr/bin/env bash
set -euo pipefail

# Load .env if present
if [ -f .env ]; then
  set -a
  # shellcheck disable=SC1091
  . ./.env
  set +a
fi

WEB_PORT="${WEB_PORT:-8083}"
WEB_URL="http://localhost:${WEB_PORT}"

if [ -z "${REDIS_PASSWORD:-}" ]; then
  echo "[ERROR] REDIS_PASSWORD is not set. Create .env with REDIS_PASSWORD=..."
  exit 2
fi

echo "[TEST] waiting for web to respond on $WEB_URL ..."
for i in {1..30}; do
  if curl -fsS "$WEB_URL" > /dev/null; then
    echo "[OK] web responding"
    break
  fi
  sleep 0.2
done
curl -fsS "$WEB_URL" > /dev/null

echo "[TEST] redis should respond (auth)..."
REDIS_ID="$(docker compose ps -q redis)"
docker exec -i "$REDIS_ID" redis-cli -a "$REDIS_PASSWORD" ping | grep -q PONG
echo "[OK] redis responding"

echo "[ALL OK]"

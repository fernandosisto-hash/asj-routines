#!/usr/bin/env bash
# notify-telegram.sh — envia mensagem pro Telegram da ASJ
#
# Funciona em DOIS modos:
#   1) Local (no Mac do Fernando): lê de ~/.config/asj/telegram-token
#   2) Cloud (Claude Routines): lê das env vars TELEGRAM_BOT_TOKEN e TELEGRAM_CHAT_ID
#
# Uso:
#   ./scripts/notify-telegram.sh "texto da mensagem"
#   echo "texto" | ./scripts/notify-telegram.sh

set -euo pipefail

# Modo cloud: env vars já presentes? Pula leitura de arquivo
if [[ -z "${TELEGRAM_BOT_TOKEN:-}" || -z "${TELEGRAM_CHAT_ID:-}" ]]; then
  CRED_FILE="${HOME}/.config/asj/telegram-token"
  if [[ -f "$CRED_FILE" ]]; then
    # shellcheck disable=SC1090
    source "$CRED_FILE"
  fi
fi

if [[ -z "${TELEGRAM_BOT_TOKEN:-}" || -z "${TELEGRAM_CHAT_ID:-}" ]]; then
  echo "ERRO: TELEGRAM_BOT_TOKEN e/ou TELEGRAM_CHAT_ID não definidos." >&2
  echo "  - Local: crie ~/.config/asj/telegram-token com as variáveis" >&2
  echo "  - Cloud: defina como secrets na configuração do Routines" >&2
  exit 1
fi

# Lê mensagem: argumento ou stdin
if [[ $# -gt 0 ]]; then
  MSG="$*"
else
  MSG=$(cat)
fi

[[ -z "$MSG" ]] && { echo "ERRO: mensagem vazia" >&2; exit 1; }

# Telegram limita 4096 chars por mensagem; trunca se necessário
if [[ ${#MSG} -gt 4000 ]]; then
  MSG="${MSG:0:3990}…[truncado]"
fi

RESP=$(curl -sf -X POST \
  "https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/sendMessage" \
  -d "chat_id=${TELEGRAM_CHAT_ID}" \
  --data-urlencode "text=${MSG}")

if echo "$RESP" | grep -q '"ok":true'; then
  echo "OK: mensagem enviada"
else
  echo "ERRO no envio: $RESP" >&2
  exit 1
fi

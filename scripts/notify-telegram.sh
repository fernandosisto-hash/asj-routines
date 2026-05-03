#!/usr/bin/env bash
# notify-telegram.sh — envia mensagem pro Telegram da ASJ
#
# Uso:
#   ./scripts/notify-telegram.sh "texto da mensagem"
#   echo "texto" | ./scripts/notify-telegram.sh
#
# Pré-requisito: arquivo ~/.config/asj/telegram-token com:
#   TELEGRAM_BOT_TOKEN=...
#   TELEGRAM_CHAT_ID=...
#
# As credenciais NÃO estão neste repo por segurança.

set -euo pipefail

CRED_FILE="${HOME}/.config/asj/telegram-token"

if [[ ! -f "$CRED_FILE" ]]; then
  echo "ERRO: arquivo de credenciais não encontrado em $CRED_FILE" >&2
  exit 1
fi

# shellcheck disable=SC1090
source "$CRED_FILE"

if [[ -z "${TELEGRAM_BOT_TOKEN:-}" || -z "${TELEGRAM_CHAT_ID:-}" ]]; then
  echo "ERRO: TELEGRAM_BOT_TOKEN ou TELEGRAM_CHAT_ID ausentes em $CRED_FILE" >&2
  exit 1
fi

# Lê mensagem: argumento ou stdin
if [[ $# -gt 0 ]]; then
  MSG="$*"
else
  MSG=$(cat)
fi

if [[ -z "$MSG" ]]; then
  echo "ERRO: mensagem vazia" >&2
  exit 1
fi

# Envia (modo texto simples, sem markdown — mais robusto pra logs)
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

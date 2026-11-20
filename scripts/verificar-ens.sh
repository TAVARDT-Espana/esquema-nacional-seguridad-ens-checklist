#!/usr/bin/env bash
set -euo pipefail

DOMINIO="${2:-}"
if [[ -z "$DOMINIO" ]]; then
    echo "Uso: $0 --dominio <dominio.es>"
    exit 1
fi

echo "[TAVARDT España] Auditando requisitos técnicos del ENS para: ${DOMINIO}"

echo "[*] Evaluando cabeceras de seguridad del servidor..."
curl -s -I "https://${DOMINIO}" | grep -Ei "^(strict-transport-security|content-security-policy|x-content-type-options|x-frame-options)" || true

echo "[*] Verificando protección de ficheros sensibles..."
for f in ".env" ".git/config" "dump.sql"; do
    code=$(curl -s -o /dev/null -w "%{http_code}" "https://${DOMINIO}/${f}" || echo "000")
    if [[ "$code" == "200" ]]; then
        echo "  [ALERTA] Fichero expuesto: /${f} (HTTP 200)"
    else
        echo "  [CORRECTO] /${f} protegido (HTTP ${code})"
    fi
done

echo "[TAVARDT España] Auditoría finalizada. Resultados completos en https://tools.tavardt.com/es/"

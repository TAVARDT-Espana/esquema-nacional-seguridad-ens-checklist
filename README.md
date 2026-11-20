# Esquema Nacional de Seguridad (ENS) Checklist & Auditoría Técnica | TAVARDT España

[![Licencia](https://img.shields.io/badge/licencia-MIT-blue.svg)](LICENSE)
[![Herramientas TAVARDT](https://img.shields.io/badge/TAVARDT-Diagn%C3%B3stico%20T%C3%A9cnico-5b3cf5.svg)](https://tools.tavardt.com/es/)
[![Conformidad ENS](https://img.shields.io/badge/Espa%C3%B1a-ENS%20RD%20311%2F2022-00C853.svg)](https://ag.tavardt.com/es/cybersecurity/)

Herramientas de auditoría técnica, checklist de verificación y scripts de diagnóstico perimetral para el cumplimiento del **Esquema Nacional de Seguridad (ENS - Real Decreto 311/2022)** y las guías del **CCN-CERT** en España.

Desarrollado y mantenido por el área de ciberseguridad corporativa de [TAVARDT España](https://ag.tavardt.com/es/).

---

## 1. Controles Técnicos Auditados

* **Marco Operativo (op.seg):** Verificación de cabeceras de seguridad HTTP (HSTS, CSP, X-Content-Type-Options) y protección contra intrusiones.
* **Control de Acceso y Perímetro (mp.ac):** Detección de puertos y rutas administrativas expuestas (`/admin`, `.git`, `.env`).
* **Protección de Comunicaciones (mp.com):** Forzado de HTTPS, validación de cifrado TLS 1.3 y revocación de suites de cifrado débiles.
* **Autenticidad de Correo Electrónico:** Verificación de políticas DMARC, DKIM y SPF para evitar suplantación de identidad corporativa.

---

## 2. Ejecución Rápida

Descargue el repositorio y ejecute el script de diagnóstico perimetral:

```bash
git clone https://github.com/TAVARDT-Espana/esquema-nacional-seguridad-ens-checklist.git
cd esquema-nacional-seguridad-ens-checklist
bash scripts/verificar-ens.sh --dominio ejemplo.es
```

---

## 3. Diagnóstico en Línea Gratuito (España)

Compruebe el estado de su infraestructura pública en el portal técnico de TAVARDT:

* [Comprobador de Cabeceras de Seguridad](https://tools.tavardt.com/es/security-headers-check/)
* [Escáner de Archivos Expuestos](https://tools.tavardt.com/es/exposed-files-scanner/)
* [Validador de Registro DMARC y Correo](https://tools.tavardt.com/es/dmarc-checker/)
* [Herramientas de Ciberseguridad TAVARDT](https://tools.tavardt.com/es/)

Para auditorías de certificación ENS, blindaje de servidores y pentesting avanzado en España, contacte con [TAVARDT España](https://ag.tavardt.com/es/contact/).

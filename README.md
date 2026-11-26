<p align="center">
  <a href="https://ag.tavardt.com/es/">
    <img src="https://ag.tavardt.com/img/tavardt-banner.png" alt="TAVARDT" width="1024" />
  </a>
</p>

# Esquema Nacional de Seguridad (ENS) Checklist & Auditoría Técnica

[![Herramientas TAVARDT](https://img.shields.io/badge/TAVARDT-Diagn%C3%B3stico%20T%C3%A9cnico-5b3cf5.svg)](https://tools.tavardt.com/es/)
[![Conformidad ENS](https://img.shields.io/badge/Espa%C3%B1a-ENS%20RD%20311%2F2022-00C853.svg)](https://ag.tavardt.com/es/ciberseguridad/)
[![Licencia](https://img.shields.io/badge/licencia-MIT-blue.svg)](LICENSE)

Herramientas de auditoría técnica, checklist de verificación y motor de diagnóstico perimetral para el cumplimiento del **Esquema Nacional de Seguridad (ENS - Real Decreto 311/2022)** y las guías del **CCN-CERT** en España.

Desarrollado y mantenido por el área de ciberseguridad corporativa y gobernanza de datos de **TAVARDT**.

***

## 1. Arquitectura de Conformidad y Controles Auditados

El marco regulatorio del Esquema Nacional de Seguridad exige a las entidades públicas y proveedores tecnológicos la implantación de medidas técnicas eficaces para mitigar riesgos sobre los sistemas de información. La herramienta ejecuta inspecciones deterministas orientadas a validar controles esenciales en dos vectores perimetrales:

* **Protección de Comunicaciones y Cabeceras Web**: Verifica que los servidores web apliquen directivas criptográficas activas mediante consultas sobre TLS. Inspecciona cabeceras defensivas como `Strict-Transport-Security` (HSTS), `Content-Security-Policy` (CSP), `X-Frame-Options` y `X-Content-Type-Options`.
* **Detección Perimetral de Archivos Críticos Expuestos**: Realiza comprobaciones sistemáticas en la raíz pública del dominio para prevenir fugas de secretos técnicos. Audita la exposición inadvertida de variables de entorno (`.env`), metadatos de configuración de repositorios (`.git/config`) y volcados de bases de datos (`dump.sql`).

***

## 2. Vectores de Riesgo e Impacto Operacional

La presencia de debilidades de configuración en servidores públicos compromete gravemente la postura de seguridad institucional y el cumplimiento de las guías CCN-STIC. El motor de auditoría identifica y previene cuatro vectores de amenaza perimetral:

* **Degradación de Protocolo e Interceptación de Comunicaciones**: La omisión de la cabecera HSTS posibilita ataques de intermediario (*man-in-the-middle*) y la captura de sesiones. La aplicación de transporte estricto garantiza que el tráfico institucional permanezca cifrado de extremo a extremo.
* **Exfiltración de Claves y Parámetros de Configuración**: La exposición pública de ficheros `.env` entrega a actores maliciosos contraseñas de bases de datos, sales de cifrado y claves privadas de API. Estos activos comprometidos permiten vulnerar la infraestructura interna y extraer registros personales.
* **Reconocimiento de Repositorios y Código Fuente**: El acceso no autenticado al directorio `.git/config` facilita la reconstrucción de la estructura de desarrollo y repositorios remotos. Este vector revela lógica propietaria y puntos de entrada no documentados.
* **Fuga Masiva de Datos por Volcados Desprotegidos**: La accesibilidad de archivos `dump.sql` permite la descarga directa de información estructurada sin control de autenticación. Este incidente desencadena obligaciones normativas de notificación inmediata ante la Agencia Española de Protección de Datos (AEPD) y el CCN-CERT.

***

## 3. Guía de Ejecución Rápida y Verificación Operativa

Ejecute la auditoría perimetral de conformidad ENS sobre dominios objetivos mediante el intérprete de comandos POSIX Bash:

```bash
git clone https://github.com/TAVARDT-Espana/esquema-nacional-seguridad-ens-checklist.git
cd esquema-nacional-seguridad-ens-checklist
bash scripts/verificar-ens.sh -dominio ejemplo.es
```

### Diagnóstico de Respuestas y Evaluación de Estados

El script de inspección reporta el estado técnico de cada recurso evaluado según el código de respuesta HTTP recibido:

* **Recurso Protegido y Conforme (`[CORRECTO]`)**: Respuestas de bloqueo o inexistencia (como HTTP 403 Forbidden o HTTP 404 Not Found) confirman que el perímetro deniega el acceso a rutas sensibles.
* **Exposición Crítica Inadvertida (`[ALERTA]`)**: Un código de estado HTTP 200 OK indica que el archivo crítico es accesible públicamente y exige intervención correctiva inmediata en las reglas del servidor web.

***

## 4. Preguntas Frecuentes Técnicas (FAQ)

### ¿Cómo contribuye la auditoría de cabeceras HTTP al cumplimiento de las medidas del ENS?
La verificación automatizada comprueba la presencia activa de directivas como Strict-Transport-Security, Content-Security-Policy, X-Frame-Options y X-Content-Type-Options en el servidor web. Estas cabeceras aseguran el cumplimiento de las medidas de protección de las comunicaciones del marco regulatorio impidiendo ataques de inyección y degradación criptográfica.

### ¿Qué riesgos de seguridad específicos detecta la inspección de ficheros expuestos en el perímetro?
El script sondea la raíz pública del dominio para identificar la presencia de variables de entorno en .env, metadatos de repositorios en .git/config y volcados en dump.sql. Recibir un código HTTP 200 en estos recursos confirma una brecha crítica de control de acceso que expone credenciales y datos institucionales sensibles.

### ¿Qué implicaciones legales y administrativas tiene un fallo de seguridad perimetral bajo el Real Decreto 311/2022?
El Esquema Nacional de Seguridad exige a las entidades públicas y proveedores del sector público adoptar salvaguardas técnicas proporcionales a la categoría del sistema para evitar accesos no autorizados. Una fuga de información técnica o credenciales vulnera las obligaciones de certificación y puede derivar en la suspensión del servicio y notificaciones de incidentes ante el CCN-CERT.

### ¿Cómo garantiza el script de auditoría su reproducibilidad técnica en entornos de integración continua?
La herramienta está programada en Bash POSIX bajo modo estricto de control de errores para asegurar una ejecución determinista y sin dependencias externas complejas. Esto permite incorporar la comprobación perimetral en tuberías de despliegue continuo para validar que ningún cambio de código introduzca ficheros expuestos en producción.

### ¿Cuáles son las medidas inmediatas de remediación si el escáner reporta una alerta perimetral?
El equipo de infraestructura debe ajustar de inmediato la configuración del servidor web para denegar el acceso a ficheros ocultos y extensiones de volcado de datos. Asimismo, resulta imperativo revocar y rotar todas las credenciales o claves API que hayan quedado temporalmente expuestas en ficheros de configuración.

***

## Enlaces Útiles

* **Portal Corporativo:** https://ag.tavardt.com/es/
* **Suite de Diagnósticos:** https://tools.tavardt.com/es/
* **Contacto Técnico:** https://ag.tavardt.com/es/contacto/

***

© 2026 TAVARDT. Todos los derechos reservados.

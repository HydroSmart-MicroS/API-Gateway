# API Gateway · Caddy

REST público en localhost:8080; landing en /, aplicación en /app y API en /api.
Las rutas de negocio comprueban plan vigente mediante Billing. Auth, perfil y pagos permiten activar/renovar.
Los destinos validan JWT y pertenencia. La colaboración entre contextos usa RabbitMQ.

Initialize-Local genera infra/gateway/upstreams.env desde Config-Service/config/local/gateway.json.
Gateway carga ese archivo; no llama por HTTP a Config Service. Logs de acceso JSON en stdout.
Las rutas internas no se publican.

Las rutas con segmentos ocultos (`.env`, `.git`, también bajo `/app`) devuelven 404.
Compose monta solo los tres archivos públicos de la landing, sin su directorio Git.
Prueba: `tests/integration/secrets-http.cjs` desde la carpeta de infraestructura.

[README funcional](../README.md) · [Ver comunicación y colas](../docs/rabbitmq-guide.md).

## Estado desde MAIN

`GET /health` comprueba que Caddy responde. El panel en [MAIN](http://localhost:8081/status) se sirve desde Config Service cuando `ENABLE_STATUS_DASHBOARD=true` está habilitado en Compose. La ruta admite el HTML, sus archivos estáticos y el JSON de estado. El alcance de este acceso es diagnóstico local.

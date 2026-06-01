# Demoblaze (Cucumber con Capybara)

## Que corre cada cosa

- `@smoke`: flujo clave (acceso, carrito, compra, categorias basicas).
- `@regression`: casos mas detallados o de apoyo.

## Comandos utiles

> Usamos para forzar navegador una variable de entorno `BROWSER` que la puedes configurar asi:
>
> En PowerShell: `$env:BROWSER='firefox'` o `$env:BROWSER='chrome'`

- Correr todo:

```bash
cucumber
```

- Correr solo smoke:

```bash
cucumber -p smoke
```

## Reportes

- Reporte completo con HTML y JSON:

```bash
cucumber -p report
```

- Reporte solo smoke:

```bash
cucumber -p smoke_report
```

Los reportes salen en:

- `reports/cucumber.html`
- `reports/cucumber.json`
- `reports/smoke.html`
- `reports/smoke.json`

# Demoblaze (Cucumber con Capybara)

## Que corre cada cosa

- `@smoke`: flujo clave (acceso, carrito, compra, categorias basicas).

## Comandos utiles

> Usamos para forzar navegador una variable de entorno `BROWSER` que la puedes configurar asi:
>
> En PowerShell: `$env:BROWSER='firefox'` o `$env:BROWSER='chrome'`
>
> La pagina inicial se centraliza en `LANDING_PAGE_URL` y por defecto apunta a Demoblaze:
>
> En PowerShell: `$env:LANDING_PAGE_URL='https://www.demoblaze.com/index.html'`

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

## Estructura Page Object Model

Los steps delegan las acciones de UI en Page Objects ubicados en `features/support/pages`:

- `home_page.rb`: navegacion principal, categorias y productos del home.
- `auth_page.rb`: registro, login y estado de usuario autenticado.
- `product_page.rb`: detalle de producto y accion de agregar al carrito.
- `cart_page.rb`: carrito, limpieza y eliminacion de productos.
- `checkout_page.rb`: formulario de orden y confirmacion de compra.
- `contact_page.rb`: formulario de contacto.

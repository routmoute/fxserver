# Deploy on Sealos

The community-maintained Sealos template runs this Docker image in FiveM mode, with an HTTPS txAdmin interface, public TCP/UDP game ports, and persistent storage.

## Deploy and configure

You need a Sealos account, a Cfx.re account, a valid server license key from the [Cfx.re Portal](https://portal.cfx.re/), and the game entitlement required by FiveM.

[![Deploy on Sealos](<https://sealos.io/Deploy-on-Sealos.svg>)](<https://sealos.io/products/app-store/fxserver/>)

1. Click **Deploy Now** and wait for the management interface to start. Open the generated HTTPS application URL.
2. Retrieve the first-run txAdmin PIN from the container logs. Enter it, select **Link Account**, complete Cfx.re authorization, and create the backup password requested by txAdmin.
3. Follow the setup wizard using the **CFX Default FiveM** recipe. Keep its installation directory under `/txdata`, enter your server license key, run the recipe, and start the server. Recipes that require a database need their documented dependencies configured separately.
4. Open the `<app-name>-nodeport` Service resource card and copy the public game host and port for `game-tcp` and `game-udp`. In the FiveM F8 console, use `connect HOST:PORT` with that assigned game address.

The HTTPS URL opens txAdmin. Game traffic uses the public TCP/UDP endpoint mapped to internal port `30120`. The template fixes the management port at `40120` and sets `TXHOST_DATA_PATH=/txdata` and `TXHOST_GAME_NAME=fivem`.

## Storage and updates

A 1 GiB persistent volume is mounted at `/txdata`. Keep recipes, resources, administrator state, and server data inside this directory. Save and stop the game server before taking an external backup. Expand storage as resources and logs grow, and keep one replica per independent server.

The template pins build `35245` and image digest `sha256:82ea87604947cbed3960385b7f5f76999a4c7db81e97614d746bf6ddb65020ea`. Back up `/txdata` before changing the image tag or digest, then check recipe and client compatibility. Administrator credentials and the server license key are supplied during txAdmin setup; keep them private.

## Validation scope and support

The existing template record covers management startup. Licensed game-server startup, Cfx.re account linking, authenticated administration, client connections, and gameplay resource sizing remain unverified. Readiness probes check txAdmin; game-server status is available inside txAdmin.

The configured limits of 200m CPU and 256 MiB memory are an initial management-startup candidate. Size CPU, memory, and storage for your recipe and player count before hosting gameplay.

See the [versioned template](https://github.com/labring-actions/templates/blob/bbf343d8fd5cdad7c5cec6ee80d947b66da69fba/template/fxserver/index.yaml) and [existing validation scope](https://github.com/labring-actions/templates/blob/bbf343d8fd5cdad7c5cec6ee80d947b66da69fba/template/fxserver/README.md#configuration-and-storage). For Sealos deployment, networking, and storage questions, use the [Sealos templates issue tracker](https://github.com/labring-actions/templates/issues).

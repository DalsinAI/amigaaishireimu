# Aishi & Reimu for AmigaOS 3

Reproducible content-port tooling for running the **Aishi & Reimu SAGE '25
Demo** with the shared
[Amiga OpenSurge](https://github.com/DalsinAI/amigaopensurge) engine.

## Upstream

- Showcase: <https://sonicfangameshq.com/forums/showcase/aishi-reimu-sage-25-demo.2638/>
- Expected archive SHA-256: `3f80a6fea4cb790fd0e0d5090565e8f111f3eb42c6c9d9ccd5ab29432277fd51`
- Expected extracted directory: `Aishi & Reimu (SAGE '25 Demo)`
- Original engine: OpenSurge 0.6.1.2 / Allegro 5.2.9-2

The package contains complete OpenSurge GPLv3 engine source. Its showcase calls
the project a free fangame but does not grant a clear redistribution licence
for every asset, so this repository contains the reproducible local port recipe
and metadata rather than the upstream data.

## Prepare a local port

```sh
./scripts/prepare-amiga-port.sh \
  "/path/to/Aishi & Reimu (SAGE '25 Demo)" \
  ./dist/AishiReimu
```

Install the QPAK-enabled shared engine at `DH1:OpenSurgeRC1`, then run the
prepared port with `Execute DH1:AishiReimu/StartGame`. The content keeps its
own 0.6.1.2 `surge.cfg`; the engine is not copied or forked.

See [PORT_STATUS.md](PORT_STATUS.md) for validation results.


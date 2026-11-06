# Port status

- [x] Upstream package acquired and checksum recorded
- [x] Complete OpenSurge game data and bundled engine source confirmed
- [x] Reproducible content-port script added
- [x] Boot tested on Cradle AmigaOS 3 target
- [x] Title screen tested
- [ ] First playable level tested
- [x] Local stored-ZIP release candidate built

Compatibility target: the shared Amiga OpenSurge 0.6.1.3 RC engine. This game
is the closest upstream match (0.6.1.2) of the four. Public binary/data releases
are withheld until asset redistribution permission is clear.

Cradle test (2026-11-02): the custom loader, disclaimer and animated title
screen render correctly. First playable level is not yet confirmed.
The local candidate contains 1,740 files in a 174 MiB stored `game.zip` and a
fixed-path launcher. Public data redistribution remains withheld.

## Standalone RC1 (5 November 2026)

- [x] Standalone LhA with the rc3 engine inside (`scripts/package-standalone.sh`)
- [x] No game data in git or in the archive; Install-AishiReimu builds it from the player's download
- [x] Lab t4-opensurge (5 Nov): Install-AishiReimu given the downloaded zip (163830376 bytes, SHA-256 checked on the host): size checked, unpacked with GFOpenCompress, three file sizes checked, Game drawer built beside the engine, Unpack drawer removed
- [x] Game drawer compared with the upstream folder on the host: every copied file identical (this game needs no patch and has its own surge.cfg); the Windows program, src, screenshots and old logs left out
- [x] StartGame: disclaimer, title, main menu (Play Demo), character select, first level playing (HUD, timer, both characters, terrain)
- [x] Clean quit with the window's close gadget; logfile ends "tchau!"

The Installer ran unattended in the lab: a lab-only copy of Install-AishiReimu had its requesters replaced by fixed answers (choice 0: the archive) and nothing else changed. The archive check on the Amiga is by size; the SHA-256 is in the ReadMe and the Installer's first message.

## Standalone RC2 (6 November 2026): SHA-256 check in the Installer

- [x] Tools/SHA256 (port/sha256, built by scripts/build-sha256.sh with os32-gcc16-open6; 6612 bytes, same bytes on every build) in the drawer, Licences/SHA256.txt beside the other licences
- [x] Lab t4-opensurge: Tools/SHA256 gives OK/0 for the right hash, FAILED/10 for a wrong one, 20 for a missing file; inside an Installer script `(run ... (safe))` returns those codes
- [x] All three downloads (AS2R zip, Aishi & Reimu zip, Sonic The Last Hope.rar) check OK on the Amiga, 18-25 s each in the lab
- [x] Installer texts kept under 512 characters per literal: Installer 47.19 refused Install-SonicTLH's longer first message ("Symbol or String too long")
- [x] Install-AishiReimu: after the size check it asks "Check the SHA-256 of Aishi & Reimu (SAGE '25 Demo).zip before it is unpacked?" (Check it is the default); given the folder, it asks whether the player still has the zip. Archive checked on the Amiga by Tools/SHA256 (OK); the hand-run Installer test this round was Install-SonicTLH, the same generated code

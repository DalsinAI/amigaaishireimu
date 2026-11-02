#!/bin/sh
set -eu

if [ "$#" -ne 2 ]; then
    echo "usage: $0 EXTRACTED_GAME_DIR OUTPUT_DIR" >&2
    exit 2
fi

game_dir=$1
output_dir=$(realpath -m "$2")
[ -d "$game_dir" ] || { echo "game directory not found: $game_dir" >&2; exit 1; }
[ ! -e "$output_dir" ] || { echo "output already exists: $output_dir" >&2; exit 1; }
command -v zip >/dev/null 2>&1 || { echo "zip is required" >&2; exit 1; }

staging_dir=$(mktemp -d "${TMPDIR:-/tmp}/amigaaishireimu.XXXXXX")
trap 'rm -rf "$staging_dir"' EXIT HUP INT TERM

tar -C "$game_dir" \
    --exclude='*.exe' --exclude='*.dll' \
    --exclude='logfile.txt' --exclude='allegro.log' --exclude='surge.prefs' \
    --exclude='./src' --exclude='./screenshots' --exclude='./CMakeLists.txt' \
    -cf - . | tar -C "$staging_dir" -xf -

mkdir -p "$output_dir"
(cd "$staging_dir" && zip -0 -q -r "$output_dir/game.zip" .)
cp port/StartGame "$output_dir/StartGame"
chmod +x "$output_dir/StartGame"
cp README.md "$output_dir/AMIGA-PORT.md"

echo "Prepared stored PhysFS archive: $output_dir/game.zip"
echo "Launch with: Execute $output_dir/StartGame"

#!/usr/bin/env bash
# render-assets.sh
# Convert the SVG assets in ./assets/ to PNG for platforms that don't render
# SVG natively (LinkedIn feed images, Twitter/X cards, most CMSes).
#
# Idempotent — safe to run multiple times. Produces 1x and @2x versions.
#
# Detects the first available converter from: rsvg-convert, ImageMagick
# (magick or convert), Inkscape. Install one of:
#   brew install librsvg                  # smallest, fastest
#   brew install imagemagick              # most common
#   brew install --cask inkscape          # GUI app, also a CLI
#
# Usage:
#   ./render-assets.sh
#
# Output:
#   assets/banner.png            (1500 x  500)
#   assets/banner@2x.png         (3000 x 1000)
#   assets/linkedin-card.png     (1200 x  627)
#   assets/linkedin-card@2x.png  (2400 x 1254)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ASSETS_DIR="$SCRIPT_DIR/assets"

if command -v rsvg-convert >/dev/null 2>&1; then
    TOOL="rsvg-convert"
elif command -v magick >/dev/null 2>&1; then
    TOOL="magick"
elif command -v convert >/dev/null 2>&1; then
    TOOL="convert"
elif command -v inkscape >/dev/null 2>&1; then
    TOOL="inkscape"
else
    cat >&2 <<'EOF'
Error: no SVG-to-PNG converter found on PATH.

Install one of (macOS):
  brew install librsvg                  # recommended — smallest, fastest
  brew install imagemagick
  brew install --cask inkscape

Linux:
  sudo apt install librsvg2-bin         # Debian/Ubuntu
  sudo apt install imagemagick
EOF
    exit 1
fi

convert_svg() {
    local svg_path="$1"
    local png_path="$2"
    local width="$3"
    local height="$4"

    case "$TOOL" in
        rsvg-convert)
            rsvg-convert -w "$width" -h "$height" -f png "$svg_path" -o "$png_path"
            ;;
        magick|convert)
            "$TOOL" -density 384 -background none "$svg_path" \
                    -resize "${width}x${height}" "$png_path"
            ;;
        inkscape)
            inkscape "$svg_path" \
                     --export-type=png \
                     --export-filename="$png_path" \
                     -w "$width" -h "$height" >/dev/null
            ;;
    esac
}

echo "Using converter: $TOOL"
echo ""

convert_svg "$ASSETS_DIR/banner.svg"        "$ASSETS_DIR/banner.png"            1500  500
convert_svg "$ASSETS_DIR/banner.svg"        "$ASSETS_DIR/banner@2x.png"         3000 1000
convert_svg "$ASSETS_DIR/linkedin-card.svg" "$ASSETS_DIR/linkedin-card.png"     1200  627
convert_svg "$ASSETS_DIR/linkedin-card.svg" "$ASSETS_DIR/linkedin-card@2x.png"  2400 1254

echo "  banner.png            1500 x  500"
echo "  banner@2x.png         3000 x 1000"
echo "  linkedin-card.png     1200 x  627"
echo "  linkedin-card@2x.png  2400 x 1254"
echo ""
echo "Done. PNGs written to: $ASSETS_DIR"

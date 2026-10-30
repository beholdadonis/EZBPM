#!/usr/bin/env bash
# Downloads Goofy Gorillas screenshots (Steam store, player uploads and
# trailer frames) into docs/reference/goofy-gorillas/ for looking at.
# They are reference only: never put them in the game. The folder is in
# .gitignore so they never get committed to this public repo.
#
# Needs curl. Trailer frames also need ffmpeg (skipped if it's missing).
# Run from anywhere: bash docs/reference/get-goofy-gorillas-screenshots.sh

set -u
OUT="$(cd "$(dirname "$0")" && pwd)/goofy-gorillas"
mkdir -p "$OUT"

STORE="https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2627570"
UGC="https://images.steamusercontent.com/ugc"
TRAILER="https://video.akamai.steamstatic.com/store_trailers/2627570/628964/560d7934fe05dce214e0e8c2697df68c13fa9ff1/1750817610/dash_h264"

failed=0

get() { # get <file name> <url>
  [ -s "$OUT/$1" ] && return
  if ! curl -fsSL "$2" -o "$OUT/$1"; then
    rm -f "$OUT/$1"; failed=$((failed + 1)); echo "Could not download $1"; fi
}

# The play structure
get 01-structure-spiral-slides-tables.jpg   "$STORE/ss_06aebdec804aa5d39b355a34360528c691fcb138.1920x1080.jpg"
get 02-structure-wall-of-net-cubes.jpg      "$UGC/10775611649113063722/59FFF519E9D3110A852938FE4E92E8643A263B6C/"
get 03-structure-from-above.jpg             "$UGC/14093632254069645513/93291B39C6EAA623C9C774B913564CD97E7690DF/"
get 04-structure-tube-slide-tables.jpg      "$UGC/11097887407791854315/4D3681829EB8A39F15C65152B1606500009386A2/"
get 05-structure-slide-checker-floor.jpg    "$UGC/15010123892021325600/3EAF2516C0BD3EF8A055D08802573422ADAFDA64/"
get 06-spiral-slide-into-ball-pit.jpg       "$UGC/18417135512119685148/45C68AEF040255EEBBEBBFC68713DED51A747846/"
get 07-structure-tops-and-roof-trusses.jpg  "$UGC/14088591991941098603/E5EB4F1EC9CDD131EB4B9D70BB42A04020EF441A/"
get 08-looking-down-the-middle.jpg          "$UGC/18210120309577098671/50571075037E8C653591FD12000B556298C01364/"

# Inside the structure
get 10-net-corridor-padded-floor.jpg        "$UGC/13563752281167940330/AC45571C4EB572282F49B16744F1EA0D277AC2F0/"
get 11-net-tunnel.jpg                       "$UGC/13853096949234844875/BAD6234AF957EC1FF575A6DF7F00C6E698BE6BE3/"
get 12-net-room.jpg                         "$UGC/16175352369098048042/6221634ADE9FC77BA26DC3FCAD9A7608D75DDF15/"
get 13-padded-steps-inside.jpg              "$UGC/11857926991952741390/4D1BB26F185BD44F7F1806094E57B5C6A785A540/"
get 14-net-levels-stacked.jpg               "$UGC/32193398110838122/3CB3A6F5452F58B3F6F79C70BAF6F15535D2C820/"
get 15-net-deck-over-the-floor.jpg          "$UGC/10755209734609168053/5136AC0514B9421B25E6ABE646C1B96F948FF11E/"
get 16-inside-the-nets.jpg                  "$STORE/ss_30391c47afd8b38f38261cb2e2e6c85942fa4ef6.1920x1080.jpg"
get 17-ball-pit-edge-and-nets.jpg           "$STORE/ss_24483baf765ecaa88ae5246a5deef23733899e98.1920x1080.jpg"
get 18-net-corridor-dark.jpg                "$STORE/ss_28f30658620eff1d0b9f1d493846f85c0becf6c4.1920x1080.jpg"
get 19-net-cubes-with-sign.jpg              "$UGC/17069976365103570505/9DD274088AD2F83F67A6598535CC15FF8BCDC9F8/"
get 20-net-cubes-wet-floor-signs.jpg        "$UGC/46824307716771549/0A3BA6F4DCBAB264E4A4D2D0491F493E24B96BA9/"
get 21-items-on-padded-floor.jpg            "$UGC/17117529931803428204/DA0EA47FE936BF38D272657B075B3CADAED4E733/"

# Slides and ball pits
get 30-ball-pit-from-slide-top.jpg          "$UGC/2524905900330584173/414B3B0814DBB01C7F728C2A3E5798AA9AE7CF49/"
get 31-ball-pit-color-theme.jpg             "$UGC/12572247768994600382/205CEF3BF99F9440AF224AE7242B34A6D1D2FCE0/"
get 32-stray-balls-in-corridor.jpg          "$STORE/ss_17058509ccaf70f0a234773bf2cdd6cca4707ec0.1920x1080.jpg"

# Ground floor around the structure
get 40-checker-floor-play-area.jpg          "$UGC/10466343031722017224/471317DD644C75B7FBDC3648B55C9944A3CC54D3/"
get 41-toddler-mats-toy-car.jpg             "$UGC/10710810618929435790/A5F93F1A3B3665F57A76B0EA5F7B8093A1F90B58/"
get 42-giant-floor-game.jpg                 "$UGC/10268427178689240949/394B77F1F65D107D60C2162B50FE8177084FB574/"
get 43-soft-play-obstacles.jpg              "$UGC/17570772630589813904/0683B572BF705324C40BA251D25B54B39D2C6193/"
get 44-view-from-inside-toy-car.jpg         "$UGC/9535461655260396307/A35338F2BF6BCE0459DE1D251B3BC938250FCEBA/"
get 45-hallway-patterned-carpet.jpg         "$STORE/ss_220c6db0b99c48eca5ee3e747dca40216346debb.1920x1080.jpg"
get 46-open-floor-under-structure.jpg       "$STORE/ss_c51938c1b6eaafcfaaf7a52daad62b44aa0e7cd7.1920x1080.jpg"
get 47-open-floor-dark.jpg                  "$STORE/ss_43e4eda56226ddc28b66e5b998ced10298f0770d.1920x1080.jpg"
get 48-under-the-structure.jpg              "$STORE/ss_479cc807660332ea797bb4ad68b8c471eef9c449.1920x1080.jpg"
get 49-party-corner-warm-light.jpg          "$UGC/12892484837851215518/E55FA499BB8150641C97E6C926DF922B12D37003/"
get 50-play-corner-cool-light.jpg           "$UGC/13033525523947654643/812E69B37F1800BE5D085BE83D6E9CA76DF15443/"
get 51-room-colored-ceiling-wash.jpg        "$UGC/10374550702931385231/5D74232760E225EA6577B27D1C07244973B694A7/"

# Snack bar
get 60-drinks-fridge.jpg                    "$UGC/11305810602740122450/7AB8358C1EABF38C760929ADCD2EB2140070AD67/"
get 61-counter-fridge-cups.jpg              "$UGC/2411202059277822822/124CC8D5DC8A116185FAB117777CAF29A6EED116/"
get 62-kitchen-corner.jpg                   "$UGC/11025602367948434209/9724FF248BF6870B8888DD0C106D27C8CA74E8B1/"

# Lighting
get 70-lights-off-flashlight.jpg            "$UGC/11201890224654139879/57B782E629A3A9EC8A69FCA8702462CA348BBAB9/"
get 71-neon-sign-dark-room.jpg              "$UGC/12022469393471028483/8A1A0CA0334110B8D2FF1C988F526626AAAAFE0D/"
get 72-dark-net-corridor.jpg                "$STORE/ss_f1b0fbae98ef39144c842415051da563bc8a31d4.1920x1080.jpg"

# For a later map (family fun center laser tag)
get 80-glow-dots-room.jpg                   "$UGC/32191413843622816/FA6211EF7EC83C17674B416AEC5145C313350C0E/"
get 81-glow-dots-room-doorway.jpg           "$UGC/11397021635313566188/FD04CC33032B1E2FDBACE89F20B795532C2A4471/"

# Frames from the official Steam trailer: <file name> <seconds into the trailer>
FRAMES="
09-trailer-structure-and-spiral-slide.jpg 2.5
22-trailer-padded-floor-in-nets.jpg 29.5
23-trailer-net-walkway.jpg 52.5
24-trailer-crawl-tube-opening.jpg 54.5
33-trailer-ball-pit-slide-exit.jpg 3.5
34-trailer-tube-slide-outside.jpg 23.5
35-trailer-ball-pit-under-nets.jpg 21.5
36-trailer-big-ball-pit.jpg 57.5
52-trailer-foam-mats-soft-blocks.jpg 24.5
63-trailer-snack-bar-tables.jpg 25.5
"

if command -v ffmpeg >/dev/null 2>&1; then
  TMP="$(mktemp -d)"
  if curl -fsSL "$TRAILER/init-stream0.m4s" -o "$TMP/init.m4s"; then
    echo "$FRAMES" | while read -r name t; do
      [ -z "$name" ] && continue
      [ -s "$OUT/$name" ] && continue
      # The trailer is split into 3-second chunks; grab the one we need.
      chunk=$(awk -v t="$t" 'BEGIN { printf "%05d", int(t / 3) + 1 }')
      offset=$(awk -v t="$t" 'BEGIN { printf "%.2f", t - int(t / 3) * 3 }')
      if curl -fsSL "$TRAILER/chunk-stream0-$chunk.m4s" -o "$TMP/chunk.m4s"; then
        cat "$TMP/init.m4s" "$TMP/chunk.m4s" > "$TMP/clip.mp4"
        ffmpeg -nostdin -v error -y -ss "$offset" -i "$TMP/clip.mp4" -frames:v 1 -q:v 2 "$OUT/$name" \
          || echo "Could not grab $name"
      else
        echo "Could not download the trailer part for $name"
      fi
    done
  else
    echo "Could not reach the trailer, skipping trailer frames."
  fi
  rm -rf "$TMP"
else
  echo "ffmpeg not found, skipping the 10 trailer frames (the other pictures are enough)."
fi

count=$(ls "$OUT"/*.jpg 2>/dev/null | wc -l | tr -d ' ')
echo "Done: $count of 53 pictures are in $OUT"
[ "$failed" -gt 0 ] && echo "$failed store or player pictures failed to download; run this again to retry."
exit 0

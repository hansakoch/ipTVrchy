# Tvedge

IPTV player for Omarchy. Country → Category → Channels → Play.

**Channel surfing:** `+`/`-` to surf, `Esc` to go back.

## Install

```bash
# Copy files
cp tvedge-app ~/.local/bin/
cp tvedge ~/.local/bin/
chmod +x ~/.local/bin/tvedge ~/.local/bin/tvedge-app
mkdir -p ~/.local/share/tvedge
cp categories.json mpv-input.conf mpv-script.lua ~/.local/share/tvedge/
```

Requires: `mpv`, `curl`, `socat`, GTK4, libadwaita.

## How it works

1. Pick your country (🇺🇸 🇬🇧 🇩🇪 🇧🇷 🇯🇵 etc)
2. Pick a category (Sports, Movies, News...)
3. Browse channels with logos
4. Click to play, `+`/`-` to surf, `Esc` to go back

Channels fetched live from [iptv-org](https://github.com/iptv-org/iptv), cached for 6 hours.

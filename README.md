# omarchy-tv

IPTV player for [Omarchy](https://omarchy.org). Country → Category → Channels → Play.

Browse live TV from around the world. Pick your country, pick a category, start watching.

**Channel surfing:** `+`/`-` next/prev channel, `Esc` to go back.

## Install

```bash
cp omarchy-tv-app ~/.local/bin/
cp omarchy-tv ~/.local/bin/
chmod +x ~/.local/bin/omarchy-tv ~/.local/bin/omarchy-tv-app
mkdir -p ~/.local/share/omarchy-tv
cp categories.json mpv-input.conf mpv-script.lua ~/.local/share/omarchy-tv/
```

Add to Omarchy menu (`~/.config/omarchy/extensions/omarchy-menu.jsonc`):
```json
"iptv": {"icon":"󰄶","label":"TV","description":"Live IPTV — worldwide channels","action":"omarchy-tv"},
```

## Requirements

`mpv` `curl` `socat` GTK4 libadwaita

## How it works

1. **Pick your country** — 🇺🇸 🇬🇧 🇩🇪 🇧🇷 🇯🇵 etc
2. **Pick a category** — Sports, Movies, News, Entertainment...
3. **Browse channels** — logos load in background
4. **Play** — click or Enter, `+`/`-` to surf channels, `Esc` to go back

Channels from [iptv-org](https://github.com/iptv-org/iptv), cached 6 hours. `F5` to refresh.

## Keyboard

| Key | Grid | Playing (mpv) |
|-----|------|---------------|
| `+`/`-` | Surf channels | Surf channels |
| `Enter` | Play/Select | — |
| `Esc` | Back | Back to grid |
| `Arrows` | Navigate | — |
| `Space` | — | Pause |
| `Ctrl+F` | Search | — |
| `F` | Fullscreen | — |
| `F5` | Refresh cache | — |

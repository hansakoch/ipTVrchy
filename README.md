# ipTVrchy

Native IPTV player for [Omarchy](https://omarchy.org). JetBrainsMono Nerd Font. Pure Omarchy design.

Country → Category → Channels → Play. Browse live TV from around the world.

## Features

- **Omarchy-native** — reads your theme, JetBrainsMono Nerd Font, Nerd Font icons
- **Country → Category → Channels** — organized browsing
- **Channel surfing** — `+`/`-` to surf, OSD overlay
- **Keyboard-first** — every action has a shortcut
- **Fast** — curl for downloads, logos in background, nothing blocks UI
- **Live data** — channels from [iptv-org](https://github.com/iptv-org/iptv), cached 6 hours

## Install

```bash
cp omarchy-tv-app ~/.local/bin/
cp omarchy-tv ~/.local/bin/
chmod +x ~/.local/bin/omarchy-tv ~/.local/bin/omarchy-tv-app
mkdir -p ~/.local/share/omarchy-tv
cp categories.json mpv-input.conf mpv-script.lua ~/.local/share/omarchy-tv/
```

Omarchy menu entry (`~/.config/omarchy/extensions/omarchy-menu.jsonc`):
```json
"iptv": {"icon":"󰄶","label":"ipTVrchy","description":"Live IPTV — worldwide channels","action":"omarchy-tv"},
```

## Requirements

`mpv` · `curl` · `socat` · GTK4 · libadwaita

## Keyboard

| Key | Grid | Playing (mpv) |
|-----|------|---------------|
| `↑↓←→` | Navigate | — |
| `Enter` | Select/Play | — |
| `Esc` | Back | Back to grid |
| `+`/`-` | Surf channels | Surf channels |
| `Ctrl+F` | Search | — |
| `Space` | — | Pause/Resume |
| `F` | Fullscreen | Fullscreen |
| `F5` | Refresh cache | — |

## How it works

```
🇺🇸 Country → 🏈 Category → [Channel Logos] → ▶ Play
    Esc←         Esc←          Esc←         +/- surf, Esc←
```

Channels from [iptv-org](https://github.com/iptv-org/iptv) — a community-maintained collection of freely available IPTV streams.

## License

MIT

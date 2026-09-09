# ipTVrchy

Native IPTV player for [Omarchy](https://omarchy.org). JetBrainsMono Nerd Font. Theme-aware. Pure Omarchy design.

```
🇺🇸 Country → 🏈 Category → [Channel Logos] → ▶ Play
    Esc←         Esc←          Esc←         +/- surf, Esc←
```

## ⚖️ Legal Notice

**ipTVrchy is a player only.** It does not provide, sell, host, or redistribute any streams. It reads publicly available playlist indexes maintained by the [iptv-org](https://github.com/iptv-org/iptv) open-source community.

You are responsible for ensuring you have the legal right to access any content you stream in your jurisdiction. The authors assume no liability for unauthorized access to copyrighted broadcasts. The software is provided as-is under the MIT license.

## Features

- **Omarchy-native** — reads your active theme colors, JetBrainsMono Nerd Font, Nerd Font glyph icons
- **Country → Category → Channels** — organized browsing
- **Favorites** — `Ctrl+D` to toggle while playing, ★ Favorites pinned in categories
- **Channel surfing** — `+`/`-` to surf with OSD overlay
- **Keyboard-first** — every action mapped, hints in status bar
- **Fast** — curl for network, logos load in background, nothing blocks UI
- **Live data** — channels from [iptv-org](https://github.com/iptv-org/iptv) via GitLab, cached 6 hours
- **Multi-source fallback** — GitLab primary, GitHub CDN backup

## Install

```bash
cp omarchy-tv-app ~/.local/bin/
cp omarchy-tv ~/.local/bin/
chmod +x ~/.local/bin/omarchy-tv ~/.local/bin/omarchy-tv-app
mkdir -p ~/.local/share/omarchy-tv
cp mpv-input.conf ~/.local/share/omarchy-tv/
```

Omarchy menu (`~/.config/omarchy/extensions/omarchy-menu.jsonc`):
```json
"iptv": {"icon":"󰄶","label":"ipTVrchy","description":"Live IPTV — worldwide channels","action":"omarchy-tv"},
```

Hyprland keybinding (`~/.config/hypr/bindings.lua`):
```lua
o.bind("SUPER + T", "ipTVrchy", "omarchy-tv")
```

## Requirements

`mpv` · `curl` · `socat` · GTK4 · libadwaita

## Keyboard

| Key | Home/Categories | Channels | Playing |
|-----|----------------|----------|---------|
| `↑↓←→` | Navigate | Navigate | — |
| `Enter` | Select | Play | — |
| `Esc` | — | Back | Back to grid |
| `+`/`-` | — | Surf channels | Surf channels (via mpv IPC) |
| `Ctrl+F` | Search | Search | — |
| `Ctrl+D` | — | — | Toggle favorite |
| `Space` | — | — | Pause/Resume |
| `F` | Fullscreen | Fullscreen | — |
| `F5` | Refresh cache | Refresh cache | — |

## How it works

1. **Country** — flags + names, pick yours
2. **Category** — parsed from `group-title` (Sports, Movies, News, etc.) + ★ Favorites
3. **Channels** — logos load in background, click to play
4. **Playing** — mpv fullscreen, `+`/`-` to surf via IPC, `Esc` to go back, `Ctrl+D` to favorite

mpv keybindings (`mpv-input.conf`) forward `+`/`-`/`Esc` back to the app via Unix socket IPC.

## Data source

Channel indexes from [iptv-org/iptv](https://github.com/iptv-org/iptv) — a community-maintained, publicly available collection. ipTVrchy does not host, cache, or redistribute any stream content.

Source priority:
1. `gitlab.com/iptv-org/iptv` — GitLab mirror (primary)
2. `raw.githubusercontent.com/iptv-org/iptv` — GitHub CDN (fallback)
3. `iptv-org.github.io/iptv` — GitHub Pages (last resort)

Cached locally for 6 hours. `F5` to force refresh.

## License

MIT

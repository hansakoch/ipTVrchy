# omarchy-tv

Native IPTV player for [Omarchy](https://omarchy.org). Beautiful, fast, keyboard-first.

Browse live TV from around the world — pick your country, pick a category, start watching.

## Features

- **Country → Category → Channels** — organized, not chaotic
- **Channel surfing** — `+`/`-` to surf, OSD shows what's playing
- **Keyboard-first** — every action has a shortcut
- **Omarchy-native** — reads your theme colors, proper `uwsm-app` integration
- **Fast** — `curl` for downloads, logos load in background, nothing blocks the UI
- **Live data** — channels from [iptv-org](https://github.com/iptv-org/iptv), cached 6 hours

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

`mpv` · `curl` · `socat` · GTK4 · libadwaita

## Keyboard

| Key | Home/Categories | Channels | Playing (mpv) |
|-----|----------------|----------|---------------|
| `↑↓←→` | Navigate grid | Navigate grid | — |
| `Enter` | Select | Play channel | — |
| `Esc` | — | Back | Back to grid |
| `+`/`-` | — | Surf channels | Surf channels |
| `Ctrl+F` | Search | Search | — |
| `Space` | — | — | Pause/Resume |
| `F` | — | Fullscreen | Fullscreen |
| `F5` | Refresh | Refresh | — |

## How it works

```
🇺🇸 Country → ⚽ Category → [Channel Grid] → ▶ Play
                Esc←          Esc←           +/- surf, Esc←
```

1. Pick your country — flags + channel counts
2. Pick a category — Sports, Movies, News, etc (from group-title)
3. Browse channels — logos load in background
4. Play — click or Enter, `+`/`-` to surf, `Esc` to go back

mpv plays the stream. Keybindings inside mpv forward `+`/`-`/`Esc` back to the app via Unix socket IPC.

## Design

Reads your active Omarchy theme colors (`~/.config/omarchy/themes/*/colors.toml`) for native look. Works with any theme — Catppuccin, Tokyo Night, Gruvbox, etc.

## License

MIT

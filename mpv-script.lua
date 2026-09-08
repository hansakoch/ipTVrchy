-- tvedge.lua — mpv script for channel surfing
-- Forwards +/-/Esc keypresses back to the Tvedge app via IPC socket

local mp = require "mp"
local utils = require "mp.utils"
local MPV_SOCKET = "/tmp/tvedge-mpv.sock"
local APP_SOCKET = "/tmp/tvedge-app.sock"

local function send_to_app(action)
    local cmd = {"socat", "-", "UNIX-CONNECT:" .. APP_SOCKET}
    local pipe = mp.command_native({name="subprocess", args=cmd,
        stdin_data='{"action":"' .. action .. '"}\n',
        playback_only=false, capture_stdout=false, capture_stderr=false})
end

local function next_channel()
    mp.osd_message("▶ Next channel", 800)
    send_to_app("next")
end

local function prev_channel()
    mp.osd_message("◀ Prev channel", 800)
    send_to_app("prev")
end

local function quit_app()
    send_to_app("quit")
    mp.command("quit")
end

-- Bind keys (override mpv defaults for these)
mp.add_key_binding("+", "tvedge-next", next_channel)
mp.add_key_binding("=", "tvedge-next2", next_channel)
mp.add_key_binding("kp_add", "tvedge-next3", next_channel)
mp.add_key_binding("-", "tvedge-prev", prev_channel)
mp.add_key_binding("_", "tvedge-prev2", prev_channel)
mp.add_key_binding("kp_subtract", "tvedge-prev3", prev_channel)
mp.add_key_binding("esc", "tvedge-quit", quit_app)

mp.msg.info("Tvedge channel surfing loaded (+/- to surf, Esc to go back)")

import QtQuick
import Quickshell
import Quickshell.Wayland
import Quickshell.Io
import qs.Commons
import qs.Ui

Item {
  id: root

  property string pluginId: "io.github.hansakoch.iptvrchy"
  property bool launched: false

  Process {
    id: launcher
    command: ["omarchy-tv"]
    onRunningChanged: {
      if (!running) root.launched = false
    }
  }

  function activate() {
    if (!launcher.running) {
      launcher.start()
      root.launched = true
    }
  }

  function deactivate() {
    if (launcher.running) {
      launcher.signal(15) // SIGTERM
    }
    root.launched = false
  }

  Component.onCompleted: {
    // Auto-launch on overlay summon
    activate()
  }
}

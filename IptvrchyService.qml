import QtQuick
import Quickshell
import Quickshell.Io
import qs.Commons

Item {
  id: root

  property string pluginId: "io.github.hansakoch.iptvrchy"

  Process {
    id: syncProc
    command: ["bash", "-c", "echo 'ipTVrchy uses iptv-org directly, no sync needed'"]
  }

  function sync() {
    if (!syncProc.running) syncProc.start()
  }

  Component.onCompleted: {
    // No background service needed — app fetches on demand
  }
}

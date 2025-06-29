pragma Singleton
import QtQuick
import Quickshell

Singleton {
<* for name, value in colors *>
  property string {{name}}: "{{value.default.hex}}"
<* endfor *>
}


import QtQuick

Rectangle {
    id: root
    color: "transparent"

    // property alias padding: child.padding
    // property alias leftPadding: child.leftPadding
    // property alias rightPadding: child.rightPadding
    // property alias topPadding: child.topPadding
    // property alias bottomPadding: child.bottomPadding
    property real padding: 0
    property real leftPadding: padding
    property real rightPadding: padding
    property real topPadding: padding
    property real bottomPadding: padding

    // default property list<QtObject> data
    property alias child: loader.sourceComponent

    implicitHeight: loader.height + topPadding + bottomPadding
    implicitWidth: loader.width + leftPadding + rightPadding

    Loader {
        id: loader
        // x: leftPadding
        // y: topPadding
        anchors.centerIn: parent
    }
    // onChildrenChanged: {
    //     children[0].x = leftPadding
    //     children[0].y = topPadding
    // }

    // Item {
    //     id: child
    //     data: parent.data
    //
    //     x: root.leftPadding
    //     y: root.topPadding
    //     implicitHeight: children[0].implicitHeight
    //     implicitWidth: children[0].implicitWidth
    //     Component.onCompleted: {
    //         children[0].centerIn = child
    //         data.forEach(e => { 
    //             e.parent = root 
    //         })
    //     }
    // }
    // Row {
    //     id: child
    //     spacing: 0
    //     data: [root.data]
    // }
}

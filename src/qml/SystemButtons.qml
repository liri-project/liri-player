import QtQuick 2.4
import Material 0.2
import Material.ListItems 0.1 as ListItem
import QtQuick.Layouts 1.0
import QtQuick.Controls 1.2 as Controls

Rectangle {
    id:_back
    width:_row.implicitWidth
    height:  _row.implicitHeight
    property color iconsColor
    signal showMinimized;
    signal showMaximized;
    signal showFullScreen;
    signal showNormal;
    signal close;

    RowLayout {
        id: _row
        anchors{
            right: parent.right
            top: parent.top
        }

        spacing: Units.dp(10)

        Rectangle {
            width:1
            color: "transparent"
        }
        IconButton {
            iconSource: "qrc:///icons/window-minimize.svg"
            width: Units.dp(20)
            height: width
            color: _back.iconsColor
            onClicked: _back.showMinimized()
        }

        IconButton {
            iconSource: root.visibility == 4 ? "qrc:///icons/window-restore.svg" : "qrc:///icons/window-maximize.svg"
            width: Units.dp(20)
            id: sysbtn_max
            height: width
            color: _back.iconsColor
            onClicked: {
                if(root.visibility == 2)
                    _back.showMaximized();
                else
                    _back.showNormal();
            }
        }

        IconButton {
            iconSource: "qrc:///icons/window-close.svg"
            width: Units.dp(20)
            height: width
            color: _back.iconsColor
            onClicked: _back.close()
        }
    }
}

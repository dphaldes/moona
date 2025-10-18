import QtQuick
import org.kde.kirigami as Kirigami

Rectangle {
    id: rect

    default property alias children: container.children

    Item {
        id: container
        anchors.fill: rect
        anchors.margins: rect.border.width

        layer.enabled: GraphicsInfo.api !== GraphicsInfo.Software
        layer.effect: Kirigami.ShadowedTexture {
            radius: rect.radius - rect.border.radius
        }

        clip: true
    }
}

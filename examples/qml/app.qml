// Run with `qmlscene -I ../.. app.qml`

import QtQuick 2.0
import HttpServer 1.0

Item {
    width: 300; height: 200

    HttpServer {
        id: server
        Component.onCompleted: listen("127.0.0.1", 5000)
        
        onNewRequest: { // request, response
            response.writeHead(200)
            response.write("<h1>Request properties</h1><ul>")
            response.write("<li>remoteAddress: " + request.remoteAddress + "</li>")
            response.write("<li>remotePort: " + request.remotePort + "</li>")
            response.write("<li>method: " + request.method + "</li>")
            response.write("<li>url: " + request.url + "</li>")
            response.write("<li>path: " + request.path + "</li>")
            response.write("<li>httpVersion: " + request.httpVersion + "</li>")
            response.end()
        }
    }

    Text {
        anchors.centerIn: parent
        text: "Serving at <a href='http://localhost:5000'>localhost:5000</a>"
        onLinkActivated: Qt.openUrlExternally(link)
    }
}


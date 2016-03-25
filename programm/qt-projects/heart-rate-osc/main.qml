import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Controls 1.0

Window {
    visible: true
    width: 300
    height: 200
    property int currentPulse: heartRate.hr
    property string myDevice: "00:22:D0:66:F8:00"
    onCurrentPulseChanged: osc.sendHeartRate(currentPulse)

    Column {
        spacing:5
        GroupBox {
            title: "OSC server"
            Column {
                Row {
                    spacing:5
                    TextField {id: oscAddress; text:"192.168.1.220"; }
                    TextField {id: port; inputMethodHints: Qt.ImhDigitsOnly; text: "9099" }
                }
                Button {
                    id: oscUpdate;
                    text:"Update";
                    onClicked: osc.setNewTarget(oscAddress.text, parseInt(port.text) )
                }
            }
        }

        Text {id: messageLabel; text: heartRate.message; }
        Text {id: heartrateLabel; font.pointSize: 18; text: "Heart-rate: " + currentPulse}
        Button {id: scanButton; text: "Scan"; onClicked: heartRate.deviceSearch()}
        Button {id:connectButton; text:"Connect"; onClicked: heartRate.connectToService(myDevice); }
        Button {id:disconnectButton; text:"Disconnect"; onClicked: heartRate.disconnectService(); }



    }

}


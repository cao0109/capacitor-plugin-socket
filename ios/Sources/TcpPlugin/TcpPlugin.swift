@objc(TcpPlugin)
public class TcpPlugin: CAPPlugin {

    private var socket: URLSessionWebSocketTask?
    private var session: URLSession?

    @objc func connect(_ call: CAPPluginCall) {
        let ip = call.getString("ip") ?? ""
        let port = call.getInt("port") ?? 0
        
        guard !ip.isEmpty, port > 0 else {
            call.reject("Invalid IP or port")
            return
        }
        
        let url = URL(string: "ws://\(ip):\(port)")!
        session = URLSession(configuration: .default)
        socket = session?.webSocketTask(with: url)
        
        socket?.resume()
        
        // Optionally, add code here to handle connection success or failure
        
        call.resolve()
    }

    @objc func send(_ call: CAPPluginCall) {
        let data = call.getString("data") ?? ""

        guard let socket = socket else {
            call.reject("Not connected")
            return
        }

        let message = URLSessionWebSocketTask.Message.string(data)
        socket.send(message) { error in
            if let error = error {
                call.reject("Send error: \(error.localizedDescription)")
            } else {
                call.resolve()
            }
        }
    }

    @objc func disconnect(_ call: CAPPluginCall) {
        socket?.cancel(with: .goingAway, reason: nil)
        session?.invalidateAndCancel() // Optionally cancel the session as well
        call.resolve()
    }

    deinit {
        disconnect(CAPPluginCall(callbackId: "", options: [:]))
    }
}
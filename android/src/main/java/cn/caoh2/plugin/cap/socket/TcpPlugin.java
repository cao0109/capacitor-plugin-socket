package cn.caoh2.plugin.cap.socket;

import android.util.Log;
import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.Promise;
import com.getcapacitor.annotation.CapacitorPlugin;
import java.io.OutputStream;
import java.net.Socket;
import java.util.concurrent.Executors;

@CapacitorPlugin(name = "Tcp")
public class TcpPlugin extends Plugin {

    private Socket socket;
    private OutputStream outputStream;

    @PluginMethod
    public void connect(PluginCall call) {
        String ip = call.getString("ip");
        int port = call.getInt("port");
        Executors
            .newSingleThreadExecutor()
            .execute(
                () -> {
                    try {
                        socket = new Socket(ip, port);
                        outputStream = socket.getOutputStream();
                        call.resolve();
                    } catch (Exception e) {
                        Log.e("TcpPlugin", "Connection error", e);
                        call.reject("Connection error", e);
                    }
                }
            );
    }

    @PluginMethod
    public void send(PluginCall call) {
        String data = call.getString("data");
        Executors
            .newSingleThreadExecutor()
            .execute(
                () -> {
                    try {
                        if (outputStream != null) {
                            outputStream.write(data.getBytes());
                            outputStream.flush();
                            call.resolve();
                        } else {
                            call.reject("Not connected");
                        }
                    } catch (Exception e) {
                        Log.e("TcpPlugin", "Send error", e);
                        call.reject("Send error", e);
                    }
                }
            );
    }

    @PluginMethod
    public void disconnect(PluginCall call) {
        Executors
            .newSingleThreadExecutor()
            .execute(
                () -> {
                    try {
                        if (socket != null) {
                            socket.close();
                            call.resolve();
                        } else {
                            call.reject("Not connected");
                        }
                    } catch (Exception e) {
                        Log.e("TcpPlugin", "Disconnect error", e);
                        call.reject("Disconnect error", e);
                    }
                }
            );
    }
}

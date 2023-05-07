// packages
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
// files
import 'package:activity_app/globals.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test"),
      ),
      body: Center(
        child: OutlinedButton(
          child: const Text("Test"),
          onPressed: () {
            final IO.Socket socket = IO.io(
              serverUrl,
              IO.OptionBuilder()
                  .setTransports(['websocket'])
                  .disableAutoConnect()
                  .build(),
            );

            socket.connect();

            socket.onConnect((_) {
              print("connected");
              socket.emit("root");
            });

            socket.on("root", (data) {
              print(data);
            });

            socket.disconnect();
          },
        ),
      ),
    );
  }
}

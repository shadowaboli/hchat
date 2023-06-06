import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class chatController extends GetxController {
  TextEditingController magssageInCon = TextEditingController();
  late IO.Socket socket;

  @override
  void onInit() {
    super.onInit();
    socket = IO.io(
        'http://localhost:3000',
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .build());
    socket.connect();
    print(socket);
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  sendMassgae() {
    // magssageInCon.text ="";
    var magJson = {"message": magssageInCon.text, "sendByMe": socket.id};
    socket.emit("message", magJson);
    print(magJson);
    print(magssageInCon.text);
  }
}

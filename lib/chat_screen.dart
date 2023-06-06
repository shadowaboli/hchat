import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hchat/chat_controller.dart';
import 'package:hchat/massage_item.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  chatController chatPageController = Get.put(chatController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Chat"),
        ),
        body: Container(
          child: Column(children: [
            Expanded(
                flex: 9,
                child: Container(
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                    return MessageItem();
                  }),
                )),
            Expanded(
                child: TextField(
              controller: chatPageController.magssageInCon,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan),
                      borderRadius: BorderRadius.circular(10)),
                  suffixIcon: Container(
                    child: IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () => chatPageController.sendMassgae()),
                  )),
            ))
          ]),
        ),
      ),
    );
  }
}

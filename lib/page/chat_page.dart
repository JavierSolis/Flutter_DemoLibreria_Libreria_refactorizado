import 'package:Libreria_chat/constants.dart';
import 'package:Libreria_chat/widget/widget_chat.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String contactName;
  String userName;
  final String urlContactPhoto;

  ChatPage({
    Key key,
    @required this.contactName,
    @required this.urlContactPhoto,
    this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (this.userName == null) {
      this.userName = CHAT_USER_NAME;
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.network(
              this.urlContactPhoto,
              height: 35,
            ),
            SizedBox(
              width: 15,
            ),
            Text(this.contactName)
          ],
        ),
      ),
      body: ChatContent(contactName: this.contactName, userName: this.userName),
    );
  }
}

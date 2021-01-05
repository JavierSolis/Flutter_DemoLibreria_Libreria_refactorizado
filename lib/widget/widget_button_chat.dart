import 'package:Libreria_chat/page/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ButtonChatWidget extends StatelessWidget {
  final String urlContactPhoto;
  final String nameContact;
  const ButtonChatWidget({Key key, this.nameContact, this.urlContactPhoto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => ChatPage(
                    contactName: this.nameContact,
                    urlContactPhoto: this.urlContactPhoto)));
      },
      child: Icon(AntDesign.message1),
    );
  }
}

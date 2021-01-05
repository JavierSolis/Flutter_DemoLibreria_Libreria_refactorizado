import 'package:Libreria_chat/constants.dart';
import 'package:Libreria_chat/page/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

void main() {
  CHAT_USER_NAME = "Javier S.";

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => ChatPage(
                          contactName: "María F.",
                          urlContactPhoto:
                              "https://crop-circle.imageonline.co/images/picture.png",
                        )));
          },
          child: Icon(AntDesign.message1),
        ),
        body: Container(
          child: Center(
            child: Text("Librería"),
          ),
        ));
  }
}

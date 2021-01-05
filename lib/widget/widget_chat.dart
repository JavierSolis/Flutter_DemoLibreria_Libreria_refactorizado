import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ChatContent extends StatefulWidget {
  final String contactName;
  final String userName;
  final msgController = TextEditingController();

  ChatContent({Key key, @required this.contactName, @required this.userName})
      : super(key: key);

  @override
  _ChatContentState createState() => _ChatContentState();
}

class ChatModel {
  String name;
  String msg;
  ChatModel({this.name, this.msg});
}

class _ChatContentState extends State<ChatContent> {
  final List<ChatModel> names = <ChatModel>[];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
          color: Color(0xffECE7E1),
          child: ListView.builder(
            reverse: true,
            padding: const EdgeInsets.all(15),
            itemCount: names.length,
            itemBuilder: (BuildContext context, int index) {
              var name = names[index].name;
              var msg = names[index].msg;

              var weighStart = 50.0;
              var weighEnd = 0.0;
              var color = Colors.orange[800];
              if (this.widget.userName != name) {
                weighStart = 0.0;
                weighEnd = 50.0;
                color = Colors.red[800];
              }

              double c_width = MediaQuery.of(context).size.width * 0.8;

              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                margin:
                    EdgeInsets.only(top: 10, left: weighStart, right: weighEnd),
                //color: Colors.white,
                padding: const EdgeInsets.only(
                  top: 5,
                  right: 10,
                  left: 10,
                  bottom: 5,
                ),
                width: c_width,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      name,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                    Text(msg, textAlign: TextAlign.left),
                  ],
                ),
              );
            },
          ),
        )),
        ChatFormMsg(
          msgController: this.widget.msgController,
          callbackSendMsg: () async {
            setState(() {
              var newChat = ChatModel(
                name: this.widget.userName,
                msg: this.widget.msgController.text,
              );
              names.insert(0, newChat);
              this.widget.msgController.text = "";
            });

            await Future.delayed(const Duration(seconds: 3), () => "1");

            var newChatContact = ChatModel(
              name: this.widget.contactName,
              msg: "Si",
            );

            setState(() {
              names.insert(0, newChatContact);
            });
          },
        ),
      ],
    );
  }
}

class ChatFormMsg extends StatelessWidget {
  final TextEditingController msgController;
  final VoidCallback callbackSendMsg;
  const ChatFormMsg(
      {Key key, @required this.msgController, this.callbackSendMsg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffF7F7F7),
      padding: EdgeInsets.only(
        bottom: 15,
        left: 15,
        right: 15,
        top: 7,
      ),
      child: new Row(
        children: <Widget>[
          new Flexible(
            child: new TextField(
              controller: this.msgController,
              decoration: new InputDecoration(
                contentPadding:
                    EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(50.0),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0xffd4d4d4), width: 1.0),
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(50.0),
                  ),
                ),
                filled: true,
                hintStyle: new TextStyle(color: Colors.grey[800]),
                hintText: "Aa...",
                fillColor: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 15),
          FloatingActionButton(
              child: Icon(MaterialIcons.send),
              onPressed: () {
                //FocusScope.of(context).unfocus();
                this.callbackSendMsg();
              }),
        ],
      ),
    );
  }
}

class ChatMessages extends StatefulWidget {
  ChatMessages({Key key}) : super(key: key);

  void updateMessage() {}
  @override
  _ChatMessagesState createState() => _ChatMessagesState();
}

class _ChatMessagesState extends State<ChatMessages> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: SingleChildScrollView(
          child: Text("mensajer"),
        ),
      ),
    );
  }
}

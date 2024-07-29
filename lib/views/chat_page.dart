import 'package:chatapp/constant/chat_message.dart';
import 'package:chatapp/constant/color.dart';
import 'package:chatapp/model/message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController messageController = TextEditingController();
  List messages = [
    MessageModel(
        message: 'Hello',
        sender: '101',
        receiver: '201',
        timestamp: DateTime(2000),
        isseenByReceiver: false),
    MessageModel(
        message: 'hi',
        sender: '201',
        receiver: '101',
        timestamp: DateTime(2000),
        isseenByReceiver: false),
    MessageModel(
        message: 'How are you?',
        sender: '101',
        receiver: '201',
        timestamp: DateTime(2000),
        isseenByReceiver: true),
    MessageModel(
        message: 'Fine.you?',
        sender: '201',
        receiver: '201',
        timestamp: DateTime(2000),
        isseenByReceiver: true),
    MessageModel(
        message: 'Fine.you?',
        sender: '201',
        receiver: '201',
        timestamp: DateTime(2000),
        isseenByReceiver: true,
        isImage: true),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leadingWidth: 40,
        scrolledUnderElevation: 0,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage:
                  const Image(image: AssetImage('assets/user.png')).image,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Other User',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text('Online',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8),
              child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) => ChatMessage(
                      msg: messages[index], currentUser: '101', isImage: true)),
            ),
          ),
          Container(
            margin: EdgeInsets.all(6),
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
                color: secondaryColor, borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Expanded(
                    child: TextFormField(
                      controller: messageController,
                  decoration: InputDecoration(border: InputBorder.none,hintText: "Type a message..."),
                ),),
                IconButton(onPressed: (){}, icon: Icon(Icons.image)),
                IconButton(onPressed: () {}, icon: Icon(Icons.send))
              ],
            ),
          )
        ],
      ),
    );
  }
}

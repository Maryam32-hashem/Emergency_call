import 'package:chatapp/domaIn/chatDetailsModel.dart';
import 'package:chatapp/presentation/screens/chatPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatDetails extends StatefulWidget {
  const ChatDetails({super.key});

  @override
  State<ChatDetails> createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  List<ChatDetailsModel> messages = [
    ChatDetailsModel(messegeContent: 'Hello, Will', messegeType: 'receive'),
    ChatDetailsModel(messegeContent: 'How have you been?', messegeType: 'receive'),
    ChatDetailsModel(messegeContent: 'Hey Kriss, I am doing fine dude. wbu?', messegeType: 'send'),
    ChatDetailsModel(messegeContent: 'ehhhh, doing OK.', messegeType: 'receive'),
    ChatDetailsModel(messegeContent: 'Is there any thing wrong?', messegeType: 'receive'),

    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0.0,
        flexibleSpace: SafeArea(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatPage()));
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      )),
                  SizedBox(width: 2),
                  CircleAvatar(
                    backgroundImage: NetworkImage(''),
                    maxRadius: 20,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'name',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        'online',
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 13),
                      ),
                    ],
                  )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.settings,
                        color: Colors.black54,
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
      body: Stack(

        children: <Widget>[
          ListView.builder(
            itemCount: messages.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 10,bottom: 10),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
              return Container(
                padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                child: Align(
                  alignment: (messages[index].messegeType == "receiver"?Alignment.topLeft:Alignment.topRight),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: (messages[index].messegeType  == "receiver"?Colors.grey.shade200:Colors.blue[200]),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Text(messages[index].messegeContent, style: TextStyle(fontSize: 15),),
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18,
                    ),
                    backgroundColor: Colors.blue,
                    elevation: 0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

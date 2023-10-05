import 'package:chatapp/presentation/widgets/conversationList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domaIn/chatUsersModel.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatUsers> chatUsers = [
    ChatUsers(name: "Jane Russel", messegeText: "Awesome Setup", imageUrl: "images/userImage1.jpeg", time: "Now"),
    ChatUsers(name: "Glady's Murphy", messegeText: "That's Great", imageUrl: "images/userImage2.jpeg", time: "Yesterday"),
    ChatUsers(name: "Jorge Henry", messegeText: "Hey where are you?", imageUrl: "images/userImage3.jpeg", time: "31 Mar"),
    ChatUsers(name: "Philip Fox", messegeText: "Busy! Call me in 20 mins", imageUrl: "images/userImage4.jpeg", time: "28 Mar"),
    ChatUsers(name: "Debra Hawkins", messegeText: "Thankyou, It's awesome", imageUrl: "images/userImage5.jpeg", time: "23 Mar"),
    ChatUsers(name: "Jacob Pena", messegeText: "will update you in evening", imageUrl: "images/userImage6.jpeg", time: "17 Mar"),
    ChatUsers(name: "Andrey Jones", messegeText: "Can you please share the file?", imageUrl: "images/userImage7.jpeg", time: "24 Feb"),
    ChatUsers(name: "John Wick", messegeText: "How are you?", imageUrl: "images/userImage8.jpeg", time: "18 Feb"),
    ChatUsers(name: "Jane Russel", messegeText: "Awesome Setup", imageUrl: "images/userImage1.jpeg", time: "Now"),
    ChatUsers(name: "Glady's Murphy", messegeText: "That's Great", imageUrl: "images/userImage2.jpeg", time: "Yesterday"),
    ChatUsers(name: "Jorge Henry", messegeText: "Hey where are you?", imageUrl: "images/userImage3.jpeg", time: "31 Mar"),
    ChatUsers(name: "Philip Fox", messegeText: "Busy! Call me in 20 mins", imageUrl: "images/userImage4.jpeg", time: "28 Mar"),
    ChatUsers(name: "Debra Hawkins", messegeText: "Thankyou, It's awesome", imageUrl: "images/userImage5.jpeg", time: "23 Mar"),
    ChatUsers(name: "Jacob Pena", messegeText: "will update you in evening", imageUrl: "images/userImage6.jpeg", time: "17 Mar"),
    ChatUsers(name: "Andrey Jones", messegeText: "Can you please share the file?", imageUrl: "images/userImage7.jpeg", time: "24 Feb"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16,right: 16,top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Conversation",style:TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 32
                    ),),
                    Container(
                      padding: EdgeInsets.only(left: 8,right: 8,top: 2,bottom: 2),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.pink[50]
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.add,color: Colors.pink,size: 20,),
                          SizedBox(width: 2,),
                          Text("Add New",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
               padding: EdgeInsets.only(top: 16,right: 16,left: 16),
              child: SearchBar(
                elevation:MaterialStateProperty.all(0.0),
                hintText: "Search...",
                hintStyle: MaterialStateProperty.all(
                  TextStyle(
                    color: Colors.grey.shade600
                  )
                ),
                leading: Icon(Icons.search,color: Colors.grey.shade600,size: 16,),
                backgroundColor: MaterialStateProperty.all(
                  Colors.grey.shade100
                ),

              ),

            ),
            SizedBox(
             height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: chatUsers.length,
                  padding: EdgeInsets.only(top: 16),
                  itemBuilder: (context,index){
                    return ConversationList(name: chatUsers[index].name,
                      messageText:chatUsers[index].messegeText,
                      imageUrl: chatUsers[index].imageUrl,
                      time: chatUsers[index].time,
                      isMessageRead: (index == 0 || index == 3)?true:false,);
                  }),
            ),

          ],
        )
      ),
    );
  }
}

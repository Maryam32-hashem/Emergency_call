import 'package:chatapp/presentation/screens/chatPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: ChatPage(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey.shade600,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        type: BottomNavigationBarType.fixed,

        items: [
          BottomNavigationBarItem(
              icon:Icon( Icons.message),
            label: "Chats"
          ),
          BottomNavigationBarItem(
              icon:Icon( Icons.group_work),
              label: "Channels"
          ),
          BottomNavigationBarItem(
              icon:Icon( Icons.account_box),
              label: "Profile"
          ),
        ],
      ),
    );
  }
}



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String phoneNumber;
  @override

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: UniqueKey(),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 32,vertical: 83),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 _buildTextIntro(),
                  SizedBox(height: 110,),
                  _buildFromField(),
                  SizedBox(height: 70,),
                  _buildNextButton(),

                ],
              ),

            ),
          ),
        ),
      ),
    );
  }
}
Widget _buildTextIntro(){
  return Column(
    children: [
      Text('what is your phone number',style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.red
      ),),
      SizedBox(height: 30,),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 2),
        child: Text(
          'Please Enter your phone Number to verify your account',style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.red
        ),
        ),
      )
    ],
  );
}
Widget _buildFromField(){

  return Row(
    children: [
      Expanded(
        flex: 1,
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12,vertical: 16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(8)),

            ),
            child: Text(generateCountryFlag() +' +20'),
      )),
      SizedBox(width: 16,),
      Expanded(
          flex: 2,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12,vertical: 2),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(8)),

            ),
            child: TextFormField(
              autofocus: true,
              style: TextStyle(
                fontSize: 18,
                letterSpacing: 2.0,

              ),
              decoration: InputDecoration(
                border: InputBorder.none
              ),
              cursorColor: Colors.red,
              keyboardType: TextInputType.phone,
              validator: (value){
                if(value !.isEmpty){
                  return "Please Enter your phone Number";
                }
                else if (value.length<11){
                  return "Too short for a phone Number"
;                }
                return null ;},
              onSaved: (value){
                late String phoneNumber;
                phoneNumber = value!;
              },

            ),
          )),
    ],
  );}
String generateCountryFlag(){
  String countryCode ='eg';
  String flag=countryCode.toLowerCase().replaceAllMapped(RegExp('r[A-z]'), (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0)+ 127397));
  return flag;
}
Widget _buildNextButton(){
  return Align(
    alignment: Alignment.centerRight,
    child: ElevatedButton(
      onPressed: (){},
      child: Text('Next',style: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),),
      style: ElevatedButton.styleFrom(
        maximumSize: Size(110, 50),
        primary: Colors.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
      ),
    ),
  );
}

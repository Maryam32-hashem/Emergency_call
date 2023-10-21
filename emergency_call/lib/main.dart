


//import 'package:firebase_core/firebase_core.dart';
import 'package:emergency_call/view/screens/login.dart';
import 'package:emergency_call/view/screens/report.dart';
import 'package:emergency_call/view/screens/request.dart';
import 'package:emergency_call/view/screens/requests.dart';
import 'package:emergency_call/view_model/app_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  //1) initialization of fire base
  runApp(ChangeNotifierProvider(
      create: (context)=>RequestPageViewModel(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.red
    ));
    return MaterialApp(
      initialRoute: '/',
      routes:{
        '/':(context)=>const ReportPage(),
        '/second':(context)=> const EmergencyRequest(),
        '/third':(context)=> const Requests(),
        '/l':(context)=>const LoginScreen()

      } ,

      debugShowCheckedModeBanner: false,
    );
  }
}
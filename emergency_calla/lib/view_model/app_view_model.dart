import 'package:emergency_calla/view/screens/request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RequestPageViewModel extends ChangeNotifier{
  void requestPage(Widget textFormField,BuildContext context){
Navigator.pushNamed(context, '/second')
    ;
  }
}
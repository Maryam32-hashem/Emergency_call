
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/app_view_model.dart';
import '../screens/request.dart';

class RequestIconButton extends StatelessWidget {
  const RequestIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RequestPageViewModel>(builder: (context,viewModel,child){
      return IconButton(
        icon:Icon(Icons.assignment_add),
        onPressed: (){
          
viewModel.requestPage(EmergencyRequest(), context);
        },);
    });
  }
}

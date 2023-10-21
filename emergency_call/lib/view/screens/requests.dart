

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../view_model/app_view_model.dart';

class Requests extends StatefulWidget {
  const Requests({super.key});

  @override
  State<Requests> createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {


  @override
  Widget build(BuildContext context) {

    return Consumer<RequestPageViewModel>(builder: (context,viewModel,child){
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(
              "YOUR REQUESTS",style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20
          )
          ),
        ),
        body:SafeArea(
          bottom: false,
          child:Padding(
            padding: const EdgeInsets.all(10.0),

            child: ListView.separated(
                itemBuilder: (context,index){
                  return Dismissible(
                      key: UniqueKey(),
                      onDismissed: (direction){
                        HapticFeedback.mediumImpact();
                        viewModel.deleteRequestName(index);
                        viewModel.deleteRequestPhoneNumber(index);
                        viewModel.deleteRequestLocation(index);
                      },
                      child: Container(
                      height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red
                        ),
                        child:Padding(
                          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(viewModel.getName(index),style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),),
                              SizedBox(height: 3,),
                              Text(viewModel.getPhoneNumber(index),style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          )),
                              SizedBox(height: 3,),
                              Text(viewModel.getLocation(index),style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              )),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: IconButton(
                                    icon: Icon(Icons.send,color: Colors.white,),
                                    onPressed: (){},
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ));
                },
                separatorBuilder: (cotext,index){
                  return SizedBox(height: 16,);
                },
                itemCount: viewModel.requestsNum),
          )
        ),

      );
    });

  }
}

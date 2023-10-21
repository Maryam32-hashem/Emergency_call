
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/requests_details.dart';
import '../../view_model/app_view_model.dart';

class EmergencyRequest extends StatefulWidget {
  const EmergencyRequest({super.key});

  @override
  State<EmergencyRequest> createState() => _EmergencyRequestState();
}

class _EmergencyRequestState extends State<EmergencyRequest> {
  String selectedValu="fire";
  FocusNode myFocusNode =new FocusNode();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return
    Consumer<RequestPageViewModel>(builder: (context,viewModel,child){
      return
        Scaffold(
          appBar: AppBar(
            actions: [IconButton(onPressed: (){
              Navigator.pushNamed(context, '/third');
            },
                icon:Icon(Icons.chat))],

            title: Center(
              child: Text("REQUEST",style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              )),
            ),
            backgroundColor: Colors.red,
          ),
          body: SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              child: Padding(

                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 40,),
                    DropdownButton(


                      items: dropdownItems,
                      onChanged: (String? newValue){
                        setState(() {
                          selectedValu = newValue!;
                        });
                      },
                      style: TextStyle(color: Colors.red,fontSize:20),
                      value: selectedValu,),
                    SizedBox(height: 180,),
                    SingleChildScrollView(
                      child: Column(

                        children: [


                          TextFormField(

                            focusNode: myFocusNode,
                            cursorColor: Colors.grey,
                            keyboardType: TextInputType.name,
                            textAlign: TextAlign.center,
                            controller: nameController,

                            decoration: InputDecoration(

                                suffixIcon: Icon(Icons.account_box,color: Colors.red,),
                                labelText: 'Name',

                                labelStyle:   TextStyle(
                                    color: myFocusNode.hasFocus?Colors.red :Colors.red
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey
                                    )
                                )
                            ),
                          ),
                          SizedBox(height: 15,),
                          TextFormField(

                            controller: phoneNumberController,
                            focusNode: myFocusNode,
                            cursorColor: Colors.grey,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.phone_android,color: Colors.red,),
                                labelText: 'Phone Number',
                                labelStyle:   TextStyle(
                                    color: myFocusNode.hasFocus?Colors.grey :Colors.red
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey
                                    )
                                )
                            ),
                          ),
                          SizedBox(height: 15,),
                          TextFormField(

                            controller: addressController,
                            cursorColor: Colors.grey,
                            keyboardType: TextInputType.url,
                            focusNode: myFocusNode,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.add_location_alt_outlined,color: Colors.red,),
                                labelText: 'location',
                                labelStyle:   TextStyle(
                                    color: myFocusNode.hasFocus?Colors.grey :Colors.red
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey
                                    )
                                )
                            ),
                          ),


                          SizedBox(height: 10,),
                          ElevatedButton(onPressed: (){
                            if(nameController.text.isNotEmpty) {
                              RequestModel nameRequest = RequestModel(
                                  name: nameController.text,
                                  phoneNumber: phoneNumberController.text,
                                  address: addressController.text);
                              viewModel.addName(nameRequest);
                              viewModel.addPhoneNumber(nameRequest);
                              viewModel.addAdress(nameRequest);
                              Navigator.pushNamed(context, '/third');
                              nameController.clear();
                              phoneNumberController.clear();
                              addressController.clear();
                            }
                            else{
                              Navigator.pop(context);
                            }
    },
                            child:Text('Save',),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.red)
                            ),)
                        ],
                      ),
                    )


                  ],
                ),
              ),
            ),
          ),
        ) ;});

  }
}

List<DropdownMenuItem<String>> get dropdownItems{
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("fire"),value:"fire" ),
    DropdownMenuItem(child: Text("ambulance"),value: "ambulance"),
    DropdownMenuItem(child: Text("police"),value: "police"),
    DropdownMenuItem(child: Text("emergency"),value: "emergency"),

  ];
  return menuItems;
}


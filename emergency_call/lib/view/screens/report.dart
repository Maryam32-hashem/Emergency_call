
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../model/card_of_emergency.dart';
import '../../view_model/card_of _emergency_reposity.dart';
import '../widgets/request_icon_button.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (){Navigator.pushNamed(context, '/l');},
              icon: Icon(Icons.login,color: Colors.white,))
        ],
        backgroundColor: Colors.red,
        title: Text("REPORT",style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20
        ),),

        leading: RequestIconButton(),
      ),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.only(top: 10,left: 10),
          child: Column(
            children: [
              SizedBox(height: 10,),
              Row(children: [
                Text("What kind of emergency?",style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),),

              ],),
              SizedBox(height: 20,),
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: GridView.count(
                    crossAxisCount: 2,
                    padding: EdgeInsets.all(8.0),
                    childAspectRatio: 8.0/9.0,
                    children:
                      card(context),
                    ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
List<InkWell> card (BuildContext context){

  List <CardOfEmergency> emergencyCard =ReposityOfCard().loadCard();





  return emergencyCard.map((CardOfEmergency) =>  InkWell(
    child: Card(
      elevation: 0.0,
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          AspectRatio(
            aspectRatio: 15.0/8.0,
              child:CardOfEmergency.emergancyIcon ,

          //  IconData(CardOfEmergency.emergancyIcon,color: Colors.red,size: 40,),
          ),
          Expanded(
            child: Text(CardOfEmergency.emergencyName,style: TextStyle(
                color: Colors.red,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),),
          ),
        ],
      ),
    ),
    onTap: (){
launch('tel://'+CardOfEmergency.phoneNumber);
    },
  ) ).toList() 
    ;
}

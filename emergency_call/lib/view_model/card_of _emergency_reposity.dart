import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/card_of_emergency.dart';

class ReposityOfCard{
  List <CardOfEmergency> loadCard(){
    List<Image> images=[
      Image(image: AssetImage('assets/images/fire.png'),),
      Image(image: AssetImage('assets/images/ambulance2.png'),),
      Image(image: AssetImage('assets/images/flood.png'),),
      Image(image: AssetImage('assets/images/police2.png'),),
      Image(image: AssetImage('assets/images/accident2.png'),),
      Image(image: AssetImage('assets/images/earth2.png'),),

    ];

    List <CardOfEmergency> allCards=[
      CardOfEmergency(emergencyName: 'FIRE', emergancyIcon:images[0],phoneNumber: '180'),
     CardOfEmergency(emergencyName: 'AMBULANCE', emergancyIcon: images[1],phoneNumber: '123'),
      CardOfEmergency(emergencyName: 'FLOOD', emergancyIcon: images[2],phoneNumber: '122'),
      CardOfEmergency(emergencyName: 'POLICE', emergancyIcon: images[3],phoneNumber: '128'),
     CardOfEmergency(emergencyName: 'ACCIDENT', emergancyIcon: images[4],phoneNumber: '122'),
     CardOfEmergency(emergencyName: 'EARTHQUAKE', emergancyIcon: images[5],phoneNumber: '122'),


    ];
    return allCards ;
  }
}
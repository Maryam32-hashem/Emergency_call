
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/requests_details.dart';

class RequestPageViewModel extends ChangeNotifier{
  List <RequestModel> requestsName =<RequestModel>[

  ];
  List <RequestModel> requestsphoneNumber =<RequestModel>[

  ];
  List <RequestModel> requestsLocation =<RequestModel>[

  ];
  String getName (int requestIndex){
    return requestsName[requestIndex].name;

  }
  int get requestsNum => requestsName.length;
  String getPhoneNumber (int requestIndex){
    return requestsphoneNumber[requestIndex].phoneNumber;

  }
  String getLocation (int requestIndex){
    return requestsLocation[requestIndex].address;

  }
  void deleteRequestName(int requestIndex){
    requestsName.removeAt(requestIndex);
    notifyListeners();
  }
  void deleteRequestPhoneNumber(int requestIndex){
    requestsphoneNumber.removeAt(requestIndex);
    notifyListeners();
  }
  void deleteRequestLocation(int requestIndex){
    requestsLocation.removeAt(requestIndex);
    notifyListeners();
  }
  void requestPage(Widget textFormField,BuildContext context){
Navigator.pushNamed(context, '/second');
  }
  void addName (RequestModel newNameRequest){
    requestsName.add(newNameRequest);
    notifyListeners();
  }
  void addPhoneNumber (RequestModel newPhoneRequest){
    requestsphoneNumber.add(newPhoneRequest);
    notifyListeners();
  }
  void addAdress (RequestModel newAdressRequest){
    requestsLocation.add(newAdressRequest);
    notifyListeners();
  }
}
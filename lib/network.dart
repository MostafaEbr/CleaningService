import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

var jason;

class NetworkHelper  {
  final String _ApiUrlLogin =
      "https://www.postman.com/collections/87a943e15eded8f472b2/login";
  final String _ApiUrlconfirm_login =
      "https://www.postman.com/collections/87a943e15eded8f472b2/confirm_login";

  Future<LoginResponseModel> sendData(LoginRequestModel requestModel) async {
    http.Response response =
        await http.get(_ApiUrlLogin, headers: requestModel.toJason());
    jason = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJason(jsonDecode(response.body));
    } else {
      throw Exception("Faild to load Data");
    }
  }


  Future<String> getOtp()async {


    http.Response  response = await http.get(_ApiUrlconfirm_login);

    if(response.statusCode==200||response.statusCode==400)
      {
        var data = jsonDecode(response.body);
        String otp = data['item'][1]['request']['body']['formdata'][0]['value'];
        print(otp);
        return otp ;
      }


  }
  Future<String> getPhone()async{
    http.Response  response = await http.get(_ApiUrlLogin);

    if(response.statusCode==200||response.statusCode==400)
    {
      var data = jsonDecode(response.body);
      String phone = data['item'][0]['request']['body']['formdata'][1]['value'];
      print(phone);
      return phone;
    }
  }
}




class LoginRequestModel {
  String name;
  String phone;

  LoginRequestModel({this.name, this.phone});

  Map<String, dynamic> toJason() {
    Map<String, dynamic> map = {"name": name, "phone": phone.trim()};
    return map;
  }
}

class LoginResponseModel {
  final String key;

  final String error;

  LoginResponseModel({this.key, this.error});

  factory LoginResponseModel.fromJason(Map<String, dynamic> map) {
    return LoginResponseModel(
        key: jason["key"] != null ? jason["key"] : "",
        error: jason["error"] != null ? jason["error"] : "");
  }


}

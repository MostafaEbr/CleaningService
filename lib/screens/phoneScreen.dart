import 'package:flutter/material.dart';
import 'package:matrixtask/componant.dart';
import 'package:matrixtask/network.dart';
import 'package:matrixtask/screens/confirmScreen.dart';
import 'package:sms_autofill/sms_autofill.dart';

class PhoneScreen extends StatefulWidget {
  static String id = "PhoneScreen";

  @override
  _PhoneScreenState createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  SmsAutoFill _smsAutoFill = SmsAutoFill();
  LoginRequestModel loginRequestModel;
  NetworkHelper _networkHelper = NetworkHelper();
  var globalFormKey;
  int phone;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginRequestModel = LoginRequestModel();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Form(
          key: globalFormKey,
            child: Stack(
              children: [
//          Container(
//            alignment: Alignment.topCenter,
//            decoration: BoxDecoration(
//              image: DecorationImage(
//                image: AssetImage('images/logo.png'),
//              ),
//            ),
//          ),
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 120.0, 20.0, 0.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'سجل دخول',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 150.0, 30.0, 0.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'يرجى ادخال رقم هاتفك للحصول على رمز التحقق',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10.0, 190.0, 10.0, 10.0),
                  child: TextField(
                    onChanged: (value) {
                      loginRequestModel.name = value;
                    },
                    textAlign: TextAlign.right,
                    decoration: kFieldDecoration.copyWith(hintText: 'الإسم'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10.0, 290.0, 10.0, 10.0),
                  child: TextField(
                      onChanged: (val) {
                        loginRequestModel.phone = val;
                        int phone =int.parse(val);
                      },
                      textAlign: TextAlign.right,
                      decoration: kFieldDecoration.copyWith(hintText: 'الهاتف')),
                ),

                Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(top:300.0,bottom: 100.0),
                  child: RaisedButton(
                    padding: EdgeInsets.only(left: 80.0, right: 80.0),
                    color: Color(0xff9eb90d),
                    textColor: Colors.white,
                    onPressed: () async {
                      print(loginRequestModel.toJason());
                      if (loginRequestModel.toJason().isNotEmpty) {
                        final code = await _smsAutoFill.getAppSignature;
                        print(code);
                        Navigator.pushNamed(context, ConfirmScreen.id);
                      }
                    },
                    child: Text(
                      'ارسال',
                      style: TextStyle(fontSize: 20.0),
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

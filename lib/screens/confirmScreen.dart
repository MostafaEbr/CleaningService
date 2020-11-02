import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matrixtask/network.dart';
import 'package:matrixtask/screens/phoneScreen.dart';
import 'package:matrixtask/screens/service1Screen.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:flutter_otp/flutter_otp.dart';
import 'package:flutter_sms/flutter_sms.dart';

class ConfirmScreen extends StatefulWidget {
  static String id = "ConfirmScreen";

  @override
  _ConfirmScreenState createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  var enteredOtp;
  String otp;
  NetworkHelper network = NetworkHelper();

  // Future<String> phone = network.getPhone();
  SmsAutoFill smsAutoFill = SmsAutoFill();
  LoginRequestModel loginRequestModel = LoginRequestModel();
  PhoneScreen phoneScreen = PhoneScreen();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 150.0),
                child: Center(
                  child: Text(
                    'لقد ارسلنا لك رمز التحقق الى الرقم ',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: Text(
                    '',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
              Container(
                //margin: EdgeInsets.all(40.0),
                padding: EdgeInsets.symmetric(horizontal: 70, vertical: 20.0),
                child: PinFieldAutoFill(
                  codeLength: 4,
                  onCodeChanged: (value) {
                    enteredOtp = value;
                    print(value);
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40.0))),
                margin: EdgeInsets.only(top: 50.0),
                child: Center(
                  child: RaisedButton(
                    color: Color(0xff9eb90d),
                    textColor: Colors.white,
                    onPressed: () {
                      setState(() {
                        print(otp);
                        print(enteredOtp);
                        if (otp == enteredOtp) {
                          Navigator.pushNamed(context, Service1Screen.id);
                        } else {
                          print('Error');
                        }
                      });
                    },
                    padding:
                        EdgeInsets.symmetric(horizontal: 80.0, vertical: 10.0),
                    child: Text(
                      'تأكيد',
                      style: TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _listenForOtp() async {
    await smsAutoFill.listenForCode;
  }


  @override
  void initState()  {
    super.initState();
    _listenForOtp();



    try {
      FlutterOtp fOtp = FlutterOtp();
      fOtp.sendOtp(loginRequestModel.phone.substring(1, 11),
          ' رمز التحقق هو$recOtp()', int.parse('+20'));
      bool isCorrect = fOtp.resultChecker(enteredOtp);

      if (isCorrect) {
        print("Success");
      } else {
        {
          print("fail");
        }
      }
    } catch (e) {
      print(e);
    }
  }
}

Future<String> recOtp() async {
  NetworkHelper networkHelper = NetworkHelper();
  String otp = await networkHelper.getOtp();

  return otp;
}

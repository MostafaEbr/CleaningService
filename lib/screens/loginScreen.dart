import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matrixtask/screens/phoneScreen.dart';

class LoginScreen extends StatefulWidget {
  static String id = "LoginScreen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              height: 340.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('images/back.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.0, -1.0),
                  end: Alignment(0.0, 1.0),
                  colors: [
                    const Color(0xa6e2e1e1),
                    const Color(0xfcdfd3d3),
                    const Color(0xffdbd7d7),
                    const Color(0xff809713),
                    const Color(0xcf9eb90d)
                  ],
                  stops: [0.0, 0.559, 1.0, 1.0, 1.0],
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(169.0, 413.0),
              child: Container(
                width: 12.0,
                height: 12.0,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                  color: const Color(0xffa9a9a9),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(201.0, 413.0),
              child: Container(
                width: 12.0,
                height: 12.0,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                  color: const Color(0xffa9a9a9),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(233.0, 413.0),
              child: Container(
                width: 12.0,
                height: 12.0,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                  color: const Color(0xff9eb90d),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(130.0, 520.0),
              child: RaisedButton(
                padding: EdgeInsets.symmetric(vertical:5.0 ,horizontal:25.0 ),
                color: Color(0xff9eb90d),
                onPressed: (){

                  Navigator.pushNamed(context, PhoneScreen.id);

                },
                child: Text('تسجيل الدخول',
                    style: TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 20,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.left,
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(325.0, 27.0),
              child: Text(
                'English',
                style: TextStyle(
                  fontFamily: 'Tajawal',
                  fontSize: 17,
                  color: const Color(0xff478452),
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Transform.translate(
              offset: Offset(23.0, 22.0),
              child: Text(
                'مساعدة',
                style: TextStyle(
                  fontFamily: 'Tajawal',
                  fontSize: 20,
                  color: const Color(0xff478452),
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Transform.translate(
              offset: Offset(93.0, 145.0),
              child:

                  Container(
                width: 228.0,
                height: 128.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage('images/logo.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),

            Center(
              child: Text(
                'احجز زيارة تنظيف فورا',
                style: TextStyle(
                  fontFamily: 'Tajawal',
                  fontSize: 28,
                  color: const Color(0xff9eb90d),
                  height: 0.6071428571428571,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Column(

                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Text(
                    "بإنشاء حساب, فإنك توافق على",
                    style: TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 15,
                      color: const Color(0xff478452),
                      height: 1.1333333333333333,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Align(

                    alignment: Alignment.center,
                    child: Text(' شروط الخدمة وسياسة الخصوصية',
                      style: TextStyle(
                        fontFamily: 'Tajawal',
                        fontSize: 20,
                        color: const Color(0xff478452),
                        height: 1.1333333333333333,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

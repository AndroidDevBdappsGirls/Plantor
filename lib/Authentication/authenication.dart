import 'package:e_shop/Authentication/sign_in.dart';
import 'package:e_shop/Authentication/sign_in_option.dart';
import 'package:e_shop/Authentication/sign_up.dart';
import 'package:e_shop/Authentication/sign_up_option.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthenticScreen extends StatefulWidget {
  @override

  _AuthenticScreenState createState() => _AuthenticScreenState();


}



class _AuthenticScreenState extends State<AuthenticScreen> {



  bool sign_in = true;

  @override
  Widget build(BuildContext context) {

  return Scaffold(
  backgroundColor: Color(0xFFffffff),
  body: SingleChildScrollView(
  child: Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
  GestureDetector(
  onTap: (){
  setState(() {
  sign_in = true;
  });
  },
  child: AnimatedContainer(
  duration: Duration(milliseconds: 500),
  curve: Curves.ease,
  height: sign_in ? MediaQuery.of(context).size.height * 0.6 : MediaQuery.of(context).size.height * 0.4,
  child: CustomPaint(
  painter: CurvePainter(sign_in),
  child: Container(
  padding: EdgeInsets.only(bottom: sign_in ? 0 : 55),
  child: Center(
  child: SingleChildScrollView(
  child: Padding(
  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16,),
  child: sign_in
  ? SignIn()
      : SignInOption()
  ),
  ),
  ),
  ),
  ),
  ),
  ),
  GestureDetector(
  onTap: (){
  setState(() {
  sign_in = false;
  });
  },
  child: AnimatedContainer(
  duration: Duration(milliseconds: 500),
  curve: Curves.ease,
  height: sign_in ? MediaQuery.of(context).size.height * 0.4 : MediaQuery.of(context).size.height * 0.6,
  child: Container(
  color: Colors.transparent,
  child: Center(
  child: SingleChildScrollView(
  child: Padding(
  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
  child: !sign_in
  ? SignUp()
      : SignUpOption()
  ),
  ),
  ),
  ),
  ),
  )

  ],
  ),
  ),
  );
  }
}

class CurvePainter extends CustomPainter {

  bool outterCurve;

  CurvePainter(this.outterCurve);

  @override
  void paint(Canvas canvas, Size size){
    var paint = Paint();
    paint.color = Color(0xff007000);
    paint.style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width * 0.5, outterCurve ? size.height + 110 : size.height - 110, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

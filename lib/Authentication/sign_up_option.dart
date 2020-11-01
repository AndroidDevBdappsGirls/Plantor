import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
class SignUpOption extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Text(
          "Don't have an account?",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            height: 1,
            color: Color(0xff009000),
          ),
        ),

        SizedBox(
          height: 24,
        ),

        Container(
          height: 36,
          decoration: BoxDecoration(
            color: Color(0xff008000),
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0xff008000).withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 4,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: Text(
              "SIGN UP",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xffffffff),
              ),
            ),
          ),
        ),

      ],
    );
  }
}
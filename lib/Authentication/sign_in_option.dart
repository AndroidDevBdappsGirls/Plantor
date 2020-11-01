import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class SignInOption extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Text(
          "Already have an account?",
          style: TextStyle(
              fontSize: 18,
              color: Color(0xffffffff)
          ),
        ),

        SizedBox(
          height: 15,
        ),

        Container(
          height: 36,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0xffffffff).withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 4,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Center(

            child: Text(
              "SIGN IN",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xff009000),
              ),
            ),
          ),
        ),

      ],
    );
  }
}
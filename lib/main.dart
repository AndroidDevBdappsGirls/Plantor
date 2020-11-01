import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop/Counters/BookQuantity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Authentication/authenication.dart';
import 'package:e_shop/Config/config.dart';
import 'Counters/cartitemcounter.dart';
import 'Counters/changeAddresss.dart';
import 'Counters/totalMoney.dart';
import 'Store/storehome.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart' ;

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';



Future<void> main() async
{
  WidgetsFlutterBinding.ensureInitialized();
EcommerceApp.auth=FirebaseAuth.instance;
EcommerceApp.sharedPreferences=await SharedPreferences.getInstance();
EcommerceApp.firestore=Firestore.instance;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            title: 'PLANTOR',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: kBackgroundColor,
              primaryColor: kPrimaryColor,
              textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
              visualDensity: VisualDensity.adaptivePlatformDensity,
             // primaryColor: Colors.green,
            ),
            home: SplashScreen()
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen>
{



  @override

  void initState(){
    super.initState();
    displaySplash();
  }
  
  
  displaySplash(){
  Timer(Duration(seconds: 5),()async{
if(await EcommerceApp.auth.currentUser()!=null){
  Route route=MaterialPageRoute(builder: (_)=>StoreHome());
  Navigator.pushReplacement(context, route);

}
else{
  Route route=MaterialPageRoute(builder: (_)=>AuthenticScreen());
  Navigator.pushReplacement(context, route);


}

  });
  
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      backgroundColor: Colors.white,
      body:Center(


        child:
        Column
          (
          children:[
            Padding(
              padding: const EdgeInsets.only(top:200,),
              child: Container(
                height: 200,
                width: 200,
                child: Lottie.asset('assets/mahi.json'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:100,),
              child: SizedBox(
                width: 250.0,
                child: ColorizeAnimatedTextKit(
                    onTap: () {
                      print("Tap Event");
                    },
                    text:[
                      "Plantor",

                    ],

                    textStyle: TextStyle(
                      fontSize: 50.0,
                      fontFamily: "Horizon",

                    ),
                    colors: [
                      Colors.green,
                      Colors.orange,
                      Colors.green,
                      Colors.red,
                    ],
                    textAlign: TextAlign.start,
                    alignment: AlignmentDirectional.topStart // or Alignment.topLeft
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}

 


import 'package:e_shop/Admin/adminLogin.dart';
import 'package:e_shop/DialogBox/errorDialog.dart';
import 'package:e_shop/DialogBox/loadingDialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop/Config/config.dart';
import 'package:e_shop/Store/storehome.dart';
import 'package:e_shop/Widgets/customTextField.dart';
import 'package:e_shop/DialogBox/errorDialog.dart';
import 'package:e_shop/DialogBox/loadingDialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:e_shop/Config/config.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home_screen.dart';


class SignIn extends StatefulWidget {
  @override
  _SignInState createState()=>_SignInState();}




 class _SignInState extends State<SignIn> {
   final TextEditingController _nameTextEditingController=TextEditingController();
   final TextEditingController _emailTextEditingController=TextEditingController();
   final TextEditingController _passwordTextEditingController=TextEditingController();
   final TextEditingController _cPasswordTextEditingController=TextEditingController();
   final GlobalKey<FormState>_formkey=GlobalKey<FormState>();
   String userImageUrl="";


   @override
   Widget build(BuildContext context) {
     return Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Text(
             "Welcome to",
             style: TextStyle(
               fontSize: 18,
               color: Color(0xffffffff),
               height: 2,
             ),
           ),

           Text(
             "PLANTOR",
             style: TextStyle(
               fontSize: 36,
               color: Color(0xffffffff),
               height: 1,
               fontWeight: FontWeight.bold,
               letterSpacing: 2,
             ),
           ),

           Text(
             "Please sign in to continue",
             style: TextStyle(
               fontSize: 18,
               color: Color(0xffffffff),
               height: 2,
             ),
           ),

           SizedBox(
             height: 20,
           ),
           Form(

               key: _formkey,
               child: Column(
                   children: <Widget>[
                     TextField(
                       controller: _emailTextEditingController,
                       decoration: InputDecoration(
                         hintText: "Email / Username",
                         hintStyle: TextStyle(
                           fontSize: 18,
                           color: Color(0xffffffff),
                           fontWeight: FontWeight.bold,
                         ),
                         prefixIcon: Icon(Icons.email),
                         border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(25),
                             borderSide: BorderSide(
                               width: 0,
                               style: BorderStyle.none,
                             )
                         ),
                         filled: true,
                         fillColor: Color(0xff008b00),
                         contentPadding: EdgeInsets.symmetric(
                           horizontal: 16, vertical: 0,),
                       ),
                     ),

                     SizedBox(
                       height: 20,
                     ),

                     TextField(
                       controller: _passwordTextEditingController,
                       obscureText: true,
                       decoration: InputDecoration(
                         hintText: "Password",
                         hintStyle: TextStyle(
                           fontSize: 18,
                           color: Color(0xffffffff),
                           fontWeight: FontWeight.bold,
                         ),
                         prefixIcon: Icon(Icons.vpn_key),
                         border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(25),
                             borderSide: BorderSide(
                               width: 0,
                               style: BorderStyle.none,
                             )
                         ),
                         filled: true,
                         fillColor: Color(0xff008b00),
                         contentPadding: EdgeInsets.symmetric(
                           horizontal: 16, vertical: 0,),
                       ),
                     )
                   ]
               )
           ),

           // SizedBox(
           //   height: 20,
           // ),
           //
           // Text(
           //   "FORGOT PASSWORD ?",
           //   textAlign: TextAlign.center,
           //   style: TextStyle(
           //     fontSize: 17,
           //
           //     color: Color(0xffffffff),
           //     height: 1,
           //   ),
           // ),

           SizedBox(
             height: 24,
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

                 child: MaterialButton(
                   onPressed: () {
                     _emailTextEditingController.text.isNotEmpty &&
                         _passwordTextEditingController.text.isNotEmpty
                         ? loginUser()
                         : showDialog(
                         context: context,
                         builder: (c) {
                           return ErrorAlertDialog(
                             message: "Plz write email and password...",);
                         }
                     );
                   },

                   child: Text(
                     "SIGN IN",
                     style: TextStyle(
                       fontSize: 22,
                       fontWeight: FontWeight.bold,
                       color: Color(0xff009000),
                     ),
                   ),
                 ),
               )

           ),
           SizedBox(
             height: 24,
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

                 child: MaterialButton(
                   onPressed: () =>
                       Navigator.push(context, MaterialPageRoute(
                           builder: (context) => AdminSignInPage())),

                   child: Text(
                     "ADMIN",
                     style: TextStyle(
                       fontSize: 22,
                       fontWeight: FontWeight.bold,
                       color: Color(0xff009000),
                     ),
                   ),
                 ),
               )

           ),


         ]
     );
   }

   FirebaseAuth _auth = FirebaseAuth.instance;

   void loginUser() async
   {
     showDialog(
         context: context,
         builder: (c) {
           return LoadingAlertDialog(
             message: "Authenticating,Please wait......",);
         }
     );
     FirebaseUser firebaseUser;
     await _auth.signInWithEmailAndPassword(
       email: _emailTextEditingController.text.trim(),
       password: _passwordTextEditingController.text.trim(),
     ).then((authUser) {
       firebaseUser = authUser.user;
     }).catchError((error) {
       Navigator.pop(context);
       showDialog(context: context,
           builder: (c) {
             return ErrorAlertDialog(message: error.message.toString(),);
           }
       );
     });
     if (firebaseUser != null) {
       readData(firebaseUser).then((s){
         Navigator.pop(context);
         Route route=MaterialPageRoute(builder: (c)=>HomeScreen());
         Navigator.push(context, route);
       });
     }
   }

  Future readData(FirebaseUser fUser) async {
Firestore.instance.collection("users").document(fUser.uid).get().then((dataSnapshot) async {
  await EcommerceApp.sharedPreferences.setString("uid",dataSnapshot.data[EcommerceApp.userUID]);
  await EcommerceApp.sharedPreferences.setString(EcommerceApp.userEmail,dataSnapshot.data[EcommerceApp.userEmail]);
  await EcommerceApp.sharedPreferences.setString(EcommerceApp.userName,dataSnapshot.data[EcommerceApp.userName]);
  await EcommerceApp.sharedPreferences.setStringList(EcommerceApp.userAvatarUrl,dataSnapshot.data[EcommerceApp.userAvatarUrl]);
List<String>cartList=dataSnapshot.data[EcommerceApp.userCartList].cast<String>();
await EcommerceApp.sharedPreferences.setStringList(EcommerceApp.userCartList, cartList);
});
  }
 }

 
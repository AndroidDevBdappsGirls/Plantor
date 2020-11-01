

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop/Config/config.dart';
import 'package:e_shop/Store/storehome.dart';
import 'package:e_shop/Widgets/customTextField.dart';
import 'package:e_shop/DialogBox/errorDialog.dart';
import 'package:e_shop/DialogBox/loadingDialog.dart';
import 'package:e_shop/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();

}

  class _SignUpState extends State<SignUp>
  {
    // final TextEditingController controller;
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
  "Sign up with",
  style: TextStyle(
  fontSize: 20,
  color: Color(0xff009000),
  height: 2,
  ),
  ),

  Text(
  "PLANTOR",
  style: TextStyle(
  fontSize: 36,
  fontWeight: FontWeight.bold,
  color: Color(0xff009000),
  height: 1,
  letterSpacing: 2,
  ),
  ),

  SizedBox(
  height: 15,
  ),

  Form(
  key:_formkey,
  child:Column(
  children:[
  TextField(
  controller: _nameTextEditingController,
  decoration: InputDecoration(

  hintText: "Username",
  hintStyle: TextStyle(
  fontSize: 18,
  color: Color(0xff000000),
  fontWeight: FontWeight.bold,
  ),
  prefixIcon: Icon(Icons.person),
  border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(25),
  borderSide: BorderSide(
  width: 0,
  style: BorderStyle.none,
  )
  ),
  filled: true,
  fillColor: Colors.grey.withOpacity(0.2),
  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0,),
  ),
  ),


  SizedBox(
  height: 15,
  ),

  TextField(
    controller: _emailTextEditingController,
  decoration: InputDecoration(
  hintText: "Email",
  hintStyle: TextStyle(
  fontSize: 18,
  color: Color(0xff000000),
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
  fillColor: Colors.grey.withOpacity(0.2),
  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0,),
  ),
  ),

  SizedBox(
  height: 15,
  ),

  TextField(
    controller: _passwordTextEditingController,
  obscureText: true,
  decoration: InputDecoration(
  hintText: "Password",
  hintStyle: TextStyle(
  fontSize: 18,
  color: Color(0xff000000),
  fontWeight: FontWeight.bold,
  ),
  prefixIcon: Icon(Icons.lock_outline),
  border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(25),
  borderSide: BorderSide(
  width: 0,
  style: BorderStyle.none,
  )
  ),
  filled: true,
  fillColor: Colors.grey.withOpacity(0.2),
  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0,),
  ),
  ),

  SizedBox(
  height: 15,
  ),

  TextField(
    controller: _cPasswordTextEditingController,
  obscureText: true,
  decoration: InputDecoration(
  hintText: "Confirm Password",
  hintStyle: TextStyle(
  fontSize: 18,
  color: Color(0xff000000),
  fontWeight: FontWeight.bold,
  ),
  prefixIcon: Icon(Icons.lock_open),
  border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(25),
  borderSide: BorderSide(
  width: 0,
  style: BorderStyle.none,
  )
  ),
  filled: true,
  fillColor: Colors.grey.withOpacity(0.2),
  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0,),
  ),
  ),
  ],
  ),
  ),
  SizedBox(
  height: 16,
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
  child: MaterialButton(
  onPressed: ()=>
  {
  uploadAndSaveImage()
  },

  child: Text(
  "SIGN UP",
  style: TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.bold,
  color: Color(0xff111111),
  ),
  ),
  ),
  ),
  ),

  ],
  );


  }

  Future<void> uploadAndSaveImage() async{
  _passwordTextEditingController.text==_cPasswordTextEditingController.text?
      _emailTextEditingController.text.isNotEmpty&&_passwordTextEditingController.text.isNotEmpty&&
    _cPasswordTextEditingController.text.isNotEmpty&&_nameTextEditingController.text.isNotEmpty
      ? uploadToStorage()
          : displayDialog("Please fill all the fields....")

      : displayDialog("Password do not match....");
  }
  displayDialog(String msg)
  {
    showDialog(
      context: context,
      builder: (c){
        return ErrorAlertDialog(message: msg,);
      }
    );
  }

  uploadToStorage() async{

    showDialog(
      context: context,
      builder: (c){
        return LoadingAlertDialog(message: "Authenticating ,Please wait.......",);
      }

    );
   String imageFileName=DateTime.now().millisecondsSinceEpoch.toString();
   StorageReference storageReference=FirebaseStorage.instance.ref().child(imageFileName);
   FirebaseAuth _auth=FirebaseAuth.instance;
   FirebaseUser firebaseUser;
   await _auth.createUserWithEmailAndPassword(
       email:_emailTextEditingController.text.trim(),
       password: _passwordTextEditingController.text.trim(),
   ).then((auth){
     firebaseUser=auth.user;


   }).catchError((error){
     Navigator.pop(context);
     showDialog(context: context,
     builder: (c){
       return ErrorAlertDialog(message: error.message.toString(),);
     }

     );

    });
   if(firebaseUser!=null){
     saveUserInfoToFireStore(firebaseUser).then((value) {
      Navigator.pop(context);
      Route route=MaterialPageRoute(builder:(c)=>HomeScreen());
      Navigator.pushReplacement(context, route);
     });
   }

  }

  Future saveUserInfoToFireStore(FirebaseUser fUser) async{
    Firestore.instance.collection("users").document(fUser.uid).setData({
      "uid":fUser.uid,
      "email": fUser.email,
      "name":_nameTextEditingController.text.trim(),
      EcommerceApp.userCartList: ["garbageValue"],
    });
    await EcommerceApp.sharedPreferences.setString("uid",fUser.uid);
    await EcommerceApp.sharedPreferences.setString(EcommerceApp.userEmail,fUser.email);
    await EcommerceApp.sharedPreferences.setString(EcommerceApp.userName,_nameTextEditingController.text);
    await EcommerceApp.sharedPreferences.setStringList(EcommerceApp.userCartList,["garbageValue"] );

  }

}


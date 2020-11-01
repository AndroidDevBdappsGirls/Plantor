

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'body.dart';
import 'my_bottom_navbar.dart';



class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: buildAppbar(),
      body: Body(),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
AppBar buildAppbar(){
  return AppBar(
    elevation: 0,
    leading:IconButton(
      icon: SvgPicture.asset("assets/icons/menu.svg"),
      onPressed: (){},
    ) ,

  );
}
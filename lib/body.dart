import 'dart:async';

import 'package:e_shop/recommended_plants.dart';
import 'package:e_shop/title_with_more_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'constants.dart';
import 'featured_plants.dart';
import 'header_with_searchbox.dart';

class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    Size size= MediaQuery.of(context).size;
    return SingleChildScrollView(
        child:Column(
          children: <Widget>[
            HeaderWithSearchBox(size: size),
            TitleWithMoreBtn(
              title: "Recommended",
              press: (){},
            ),
            RecommendedPlants(),
            TitleWithMoreBtn(title: "Featured Plants",press: (){},),
            FeaturedPlants(),
            SizedBox(height: kDefaultPadding,)


          ],
        ),
    );

  }
}




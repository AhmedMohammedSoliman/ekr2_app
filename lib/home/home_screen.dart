import 'dart:async';

import 'package:ekra2_app/list/list_tab.dart';
import 'package:ekra2_app/theming/theme_data.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  static const routeName = "home" ;


  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {

@override
  void initState() {
   Timer(Duration(seconds: 3) , () => Navigator.pushReplacementNamed(context, ListTab.routeName),);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage("assets/images/logo.png")) ,
            SizedBox(height: 5,),
            Text("Read for you" , style: Theme.of(context).textTheme.headline1,),
            SizedBox(height: 40,),
            CircularProgressIndicator(
              color: MyTheme.primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
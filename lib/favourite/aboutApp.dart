import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutApp extends StatelessWidget{

  static const String routeName = "about" ;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Text("About App" , style: TextStyle(color: Colors.white , fontSize: 25 ,
                fontWeight: FontWeight.bold) , textAlign: TextAlign.center,),
              ),
              Divider(
                color: Colors.white,
                thickness: 2,
                indent: 30,
                endIndent: 30,
              ),
              Container(
                padding: EdgeInsets.only(left: 15),
                margin: EdgeInsets.symmetric(vertical: 30),
                child: Text("This version was made by : \n Ahmed Soliman"
                    , style: TextStyle(color: Colors.white , fontSize: 22 ,
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                padding: EdgeInsets.only(left: 15),
                child: Text("Ahmedellewaa22@gmail.com"
                    , style: TextStyle(color: Colors.white , fontSize: 18 ,
                        fontWeight: FontWeight.bold)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
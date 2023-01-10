import 'package:ekra2_app/favourite/aboutApp.dart';
import 'package:ekra2_app/favourite/favourite_tab.dart';
import 'package:ekra2_app/list/list_tab_body.dart';
import 'package:ekra2_app/settings/setting_tab.dart';
import 'package:ekra2_app/theming/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../searchScreen/searchScreen.dart';

class ListTab extends StatefulWidget{

  static const routeName = "list";


  @override
  State<ListTab> createState() => _ListTabState();
}

class _ListTabState extends State<ListTab> {
  String title = "Stories List" ;
  IconData appBarIcon = Icons.search ;
  int selectedIndex = 0 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$title" , style: Theme.of(context).textTheme.headline3),
        centerTitle: true,
        leading: InkWell(
          onTap: () async{
            if (appBarIcon == Icons.search){
              showSearch(context: context, delegate: SearchData());
            }else if (appBarIcon == Icons.share){
             await Share.share("Hellow World");
            }else if (appBarIcon == Icons.ac_unit){
              Navigator.pushNamed(context, AboutApp.routeName);
            }
          },
            child: Icon (appBarIcon, size: 30,)) ,
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30) ,
          topRight: Radius.circular(30)
        ),
        child: BottomAppBar(
          color: MyTheme.primaryColor,
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index){
              selectedIndex = index ;
              switch (index) {
                case 0 : title = "Stories List" ;
                appBarIcon = Icons.search ;
                break ;
                case 1 : title = "Settings" ;
                appBarIcon = Icons.ac_unit ;
                break ;
                case 2 : title = "Favourite" ;
                appBarIcon = Icons.share ;
                break ;
              }
              setState((){});
            },
            items: [ BottomNavigationBarItem(icon: Icon(Icons.list_sharp) , label: "List") ,
              BottomNavigationBarItem(icon: Icon(Icons.settings) , label: "Settings") ,
              BottomNavigationBarItem(icon: Icon(Icons.favorite) , label: "Favourite") ,


            ],
          ),
        ),
      ),
      body: listTabs[selectedIndex],
    );
  }
  List <Widget> listTabs = [ListTabBody() , SettingsTab() , FavouriteTab()];
}

import 'package:ekra2_app/storyModel/storyWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/myProvider.dart';

class FavouriteTab extends StatefulWidget{
  static const String routeName = "Favourite";
  @override
  State<FavouriteTab> createState() => _FavouriteTabState();
}

class _FavouriteTabState extends State<FavouriteTab> {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text ("Favourite List" ,style: TextStyle(color: Colors.white , fontSize: 25 ,
            fontWeight: FontWeight.bold)),
            Divider(
              color: Colors.white,
              thickness: 2,
              indent: 30,
              endIndent: 30,
            ),
            Expanded(
                child: provider.favouriteList.length == 0 ? Center(
                  child: Text("There is no favourite story" ,
                  style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
                ) :
                ListView.separated(
                    itemBuilder: (context, index) => Container(
                      height: 300,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: StoryWidget(
                          imageitem: provider.favouriteList[index].image,
                          storyitem: provider.favouriteList[index].title,
                          index: index,
                          story: provider.favouriteList[index],
                      ),
                    ),
                    separatorBuilder: (context , index) => Divider(
                      color: Colors.white,
                      thickness: 2,
                      endIndent: 10,
                      indent: 10,
                    ),
                    itemCount: provider.favouriteList.length),
            )
          ],
        ),
      ),
    );
  }
}
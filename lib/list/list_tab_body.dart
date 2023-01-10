
import 'package:ekra2_app/storyModel/storyWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/myProvider.dart';
import '../storyModel/story_details.dart';

class ListTabBody extends StatefulWidget{
  static const routeName = "listBody";

  @override
  State<ListTabBody> createState() => _ListTabBodyState();
}

class _ListTabBodyState extends State<ListTabBody> {

  @override
  Widget build(BuildContext context) {
   var  provider = Provider.of<MyProvider>(context);
   return Container(
     child: GridView.builder(
         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
           crossAxisCount: 2 ,
           mainAxisSpacing: 5 ,
           crossAxisSpacing: 5
         ),
         itemBuilder: (context , index) => InkWell(
           onTap: (){
             Navigator.pushNamed(context, StoryDetails.routeName , arguments: {
               "storyTitle" : provider.storyList[index].title ,
               "storyImage" : provider.storyList[index].image ,
               "index" : index
             });
           },
           child: StoryWidget(imageitem: provider.storyList[index].image,
               storyitem: provider.storyList[index].title , index: index , story: provider.storyList[index]),
         ) ,
     itemCount: provider.storyList.length,) ,
        );

  }
}
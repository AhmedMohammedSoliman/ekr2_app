
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/myProvider.dart';
import 'model.dart';

class StoryWidget extends StatefulWidget{
  static Color iconColor = Colors.white;


  String imageitem ;
  String storyitem ;
  int index ;
  StoryData story ;

  StoryWidget({required this.imageitem , required this.storyitem , required this.index , required this.story});

  @override
  State<StoryWidget> createState() => _StoryWidgetState();
}

class _StoryWidgetState extends State<StoryWidget> {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
   return Container(
     padding: EdgeInsets.symmetric(horizontal: 8 , vertical: 8),
     child: ClipRRect(
       borderRadius: BorderRadius.circular(30),
       child: Stack(
         children: [
           Stack(
             alignment: Alignment.bottomCenter,
             children: [
               Image(image: AssetImage("${widget.imageitem}") , width: double.infinity,height: double.infinity,
                 fit: BoxFit.cover,),
               Container(
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(20),
                   color: Colors.white,
                 ),

                 padding: EdgeInsets.all(8),
                 child: Text("${widget.storyitem}" , style: TextStyle(color: Colors.black , fontSize: 20 , fontWeight:
                 FontWeight.bold),),
               ) ,
             ],
           ),
           Positioned(
             left: 20,
             top: 20,
             child: InkWell(
               onTap: (){
                   provider.changeList(widget.story);
                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                     content: Text(provider.isExist(widget.story) ? "Story removed from Favourite List"
                       : "Story added to Favourite List" , style:
                       TextStyle(fontWeight: FontWeight.bold),)));
               },
                 child: Icon(Icons.favorite , color: provider.isExist(widget.story) ?
                 Colors.grey : Colors.red , size: 35,)),
           )
         ],
       )
     )
   );
  }
}
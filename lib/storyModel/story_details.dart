import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StoryDetails extends StatefulWidget{

  static const String routeName = "details";

  @override
  State<StoryDetails> createState() => _StoryDetailsState();
}

class _StoryDetailsState extends State<StoryDetails> {
  String text = "" ;
  String image = "";
  List <String> contentList  = [] ;
  double fontSize = 18 ;
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Map ;
    if (contentList.isEmpty){
      loadFiles(args["index"]) ;
    }

    return SafeArea(
      child: Scaffold(
         body: Column(
           children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 ElevatedButton(
                     onPressed: (){
                       fontSize ++ ;
                       setState((){});
                     }, child: Icon (Icons.add) ,
                 style: ElevatedButton.styleFrom(shape: StadiumBorder()),) ,
                 Container(
                   margin: EdgeInsets.only(top: 20),
                   padding: EdgeInsets.all(10),
                   decoration: BoxDecoration(
                       border: Border.all(color: Colors.white , width: 3) ,
                       borderRadius: BorderRadius.all(Radius.circular(30))
                   ),
                   child: Text("${args["storyTitle"]}" , style: TextStyle(color: Colors.white , fontSize: 25 , fontWeight:
                   FontWeight.bold),),
                 ) ,
                 ElevatedButton(
                     onPressed: (){
                       if (fontSize >=18){
                         fontSize -- ;
                         setState((){});
                       }
                     }, child: Icon (Icons.minimize) ,
                     style: ElevatedButton.styleFrom(shape: StadiumBorder())) ,

               ],

             ),
             SizedBox(height: 20,),
             Expanded(
               flex: 1,
                 child: Image(image: AssetImage("${args["storyImage"]}") ,
                   width: double.infinity,
                   fit: BoxFit.cover,
                 )),
             Expanded(
               flex: 2,
               child: contentList.length == 0 ? Center(child: CircularProgressIndicator())
                   : ListView.builder(
                      itemBuilder: (context , index) => Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.white,
                        child: Text("${contentList[index]}" , style: TextStyle(color: Colors.black ,
                        fontSize: fontSize ),
                        textDirection: TextDirection.rtl,),
                 )
                 , itemCount: contentList.length,),
             )

           ],
         ),
      ),
    );
  }
  Future <void> loadFiles (int index)async{
   String file = await rootBundle.loadString("assets/fileses/${index+1}.txt");
   List<String> lines = file.split("\n");
   contentList = lines ;
   setState((){
   });
    }
}
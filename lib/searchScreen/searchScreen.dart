import 'package:ekra2_app/storyModel/story_details_search.dart';
import 'package:flutter/material.dart';

class SearchData extends SearchDelegate {
  List <String> storiesNames = ["قصة عن الخشوع" , "قصة عن الام" ,
    "قصة عن الامانه" , "قصة عن الصبر" , "قصة عن الصداقة" , "قصة مؤثرة جدا" , "قصة عن النجاح" ,
    "قصة عن الكرم" , "قصة كما تدين تدان" , "قصة الاميرة النائمة" ,  "قصة رومانسيه" ,
    "قصة عن الاخلاق" , "قصة ميكى" , "قصة جحا والقاضى" ] ;

  List<String> storiesImages = ["assets/images/imageone.jpeg" , "assets/images/imagetwo.jpeg" ,
    "assets/images/imagethree.jpeg" , "assets/images/imagefour.jpeg" , "assets/images/imagefive.jpeg" ,
    "assets/images/imagesex.jpeg" , "assets/images/imageseven.jpeg" , "assets/images/imageeight.jpeg" ,
    "assets/images/imagenighn.jpeg" , "assets/images/imageten.jpeg" , "assets/images/imageeleven.jpeg" ,
    "assets/images/imagetwelv.jpeg" , "assets/images/image14.jpeg" , "assets/images/image15.jpeg"];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){
         close(context, null);
      }, icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      Navigator.pop(context);
    }, icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("results");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List <String> filterStories = storiesNames.where((story) => story.toLowerCase().contains(query.toLowerCase())&&
        story.startsWith(query)).toList();
   return ListView.separated(
       itemBuilder: (context , index) => Container(
           padding : EdgeInsets.all(10) ,child: query == "" ? ListTile(
         onTap: (){
             query = storiesNames [index];
             Navigator.pushReplacementNamed(context, StoryDetailsSearch.routeName ,
             arguments:  {
               "title" : storiesNames[index],
               "image" : storiesImages [index] ,
               "index" : index
             });
         },
         leading: Text("${storiesNames[index]}" , style: TextStyle(color: Colors.white ,
             fontSize: 20 , fontWeight: FontWeight.bold),),
         trailing: Container(
             width: 100,
             height: 150,
             child: Image(image: AssetImage("${storiesImages[index]}"),
               fit: BoxFit.cover, width: double.infinity , height: double.infinity,)),
       ) : ListTile(
         onTap: (){
          query = filterStories[index];
          Navigator.pushReplacementNamed(context, StoryDetailsSearch.routeName ,
          arguments: {
            "title" : filterStories[index],
            "image" : storiesImages [index] ,
            "index" : index
          });
         },
         leading: Text("${filterStories[index]}" , style: TextStyle(color: Colors.white ,
             fontSize: 20 , fontWeight: FontWeight.bold),),
         trailing: Container(
             width: 100,
             height: 150,
             child: Image(image: AssetImage("${storiesImages[index]}"),
               fit: BoxFit.cover, width: double.infinity , height: double.infinity,)),
       )
       ),
       separatorBuilder: (context , index) => Divider(thickness: 2, color: Colors.white, indent: 30 , endIndent: 30),
       itemCount: query == "" ? storiesNames.length : filterStories.length);
  }
}
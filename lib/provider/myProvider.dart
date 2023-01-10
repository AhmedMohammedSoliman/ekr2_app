
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../storyModel/model.dart';

class MyProvider extends ChangeNotifier{
  List <StoryData> storyList = [
    StoryData(image: "assets/images/imageone.jpeg", title: "قصة عن الخشوع") ,
    StoryData(image: "assets/images/imagetwo.jpeg", title: "قصة عن الام"),
    StoryData(image: "assets/images/imagethree.jpeg", title: "قصة عن الامانه"),
    StoryData(image: "assets/images/imagefour.jpeg", title: "قصة عن الصبر"),
    StoryData(image: "assets/images/imagefive.jpeg", title: "قصة عن الصداقة"),
    StoryData(image: "assets/images/imagesex.jpeg", title: "قصة مؤثرة جدا"),
    StoryData(image: "assets/images/imageseven.jpeg", title: "قصة عن النجاح"),
    StoryData(image: "assets/images/imageeight.jpeg", title: "قصة عن الكرم"),
    StoryData(image: "assets/images/imagenighn.jpeg", title: "قصة كما تدين تدان"),
    StoryData(image: "assets/images/imageten.jpeg", title: "قصة الاميرة النائمة") ,
    StoryData(image: "assets/images/imageeleven.jpeg", title: "قصة رومانسيه"),
    StoryData(image: "assets/images/imagetwelv.jpeg", title: "قصة عن الاخلاق"),
    StoryData(image: "assets/images/image14.jpeg", title: "قصة ميكى"),
    StoryData(image: "assets/images/image15.jpeg", title: "قصة جحا والقاضى")];

  List<StoryData> favouriteList = [];

   void changeList (StoryData story){
     bool isExist = storyList.contains(story);
     if(isExist == true){
       storyList.remove(story);
       favouriteList.add(story);
     }else{
       storyList.add(story);
       favouriteList.remove(story);
     }
     notifyListeners();
   }

   bool isExist (StoryData story){
     bool isExist = storyList.contains(story);
     return isExist ;
   }
  }

import 'package:ekra2_app/favourite/aboutApp.dart';
import 'package:ekra2_app/favourite/favourite_tab.dart';
import 'package:ekra2_app/list/list_tab.dart';
import 'package:ekra2_app/provider/myProvider.dart';
import 'package:ekra2_app/storyModel/story_details.dart';
import 'package:ekra2_app/storyModel/story_details_search.dart';
import 'package:ekra2_app/theming/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home/home_screen.dart';
import 'list/list_tab_body.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => MyProvider(),
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 late MyProvider provider ;
  @override
  Widget build(BuildContext context) {
   provider = Provider.of<MyProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName : (context) => HomeScreen() ,
        ListTab.routeName : (context) => ListTab(),
        StoryDetails.routeName : (context) => StoryDetails(),
        ListTabBody.routeName : (context) => ListTabBody(),
        AboutApp.routeName : (context) => AboutApp(),
        FavouriteTab.routeName : (context) => FavouriteTab(),
        StoryDetailsSearch.routeName : (context) => StoryDetailsSearch(),
      },
      theme: MyTheme.lightTheme,
      locale: Locale("en"),
    );
  }

}


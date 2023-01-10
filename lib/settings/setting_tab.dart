import 'package:flutter/material.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';

class SettingsTab extends StatefulWidget{

  static const String routeName = "search";

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  List<String> items = [
  "English" ,
  "Arabic" ];

  String? selectedItem;

  @override
  Widget build(BuildContext context) {
   return Container(
       width: double.infinity,
       margin: EdgeInsets.symmetric(horizontal: 20 , vertical: 20),
       child: CustomDropdownButton2(
         dropdownWidth: 300,
         buttonDecoration: BoxDecoration(
             color: Colors.white ,
             borderRadius: BorderRadius.circular(30)
         ),
         hint: 'Select Item',
         dropdownItems: items,
         onChanged: (String? value) {
           selectedItem = value ;
           setState((){});
       }, value: selectedItem,
       )
   );
    }
}


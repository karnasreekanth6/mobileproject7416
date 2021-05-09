

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moble_programingapp/src/models/Personsresponse.dart';
import 'package:moble_programingapp/src/models/pageresponse.dart';

import 'Sqlitescreen.dart';

class Basescreen {

  Sqlitescreen sqliteobj = Sqlitescreen();

  Future<List<Personresponse>> getpersoninfo() async{
    Personresponse resp;
    List<Personresponse> list = [];

    resp = Personresponse(id: 1, name: 'Swipe to the right to complete!', timeinfo: '',color: 'B71c1c');
    list.add(resp);
    resp = Personresponse(id: 2, name: 'Swipe to the left to delete', timeinfo: '',color: 'c62828');
    list.add(resp);
    resp = Personresponse(id: 3, name: 'Tap and hold to pick me up', timeinfo: '',color: 'E53935');
    list.add(resp);
    resp = Personresponse(id: 4, name: 'Pull down to create an item', timeinfo: '',color: 'EF5350');
    list.add(resp);
    resp = Personresponse(id: 5, name: 'Try shaking to undo', timeinfo: '',color: 'E57373');
    list.add(resp);
    resp = Personresponse(id: 6, name: 'Try pinching two rows apart', timeinfo: '',color: 'F9A825');
    list.add(resp);
    resp = Personresponse(id: 7, name: 'Try pinching vertically shut', timeinfo: '',color: 'F57F17');
    list.add(resp);
    resp = Personresponse(id: 8, name: 'Pull up to clear', timeinfo: '',color: 'FFEB3B');
    list.add(resp);


    int info = await sqliteobj.deleteuser();
   // backlist = await sqliteobj.savepersonslist(list, "persons");

    return list;

  }

  static const icons = <Icon>[
    Icon(Icons.eleven_mp),
    Icon(Icons.eleven_mp),
    Icon(Icons.eleven_mp),
    Icon(Icons.eleven_mp),
    Icon(Icons.eleven_mp),
  ];


  getpageinfo() async {
    Pageresponse pages;
    List<Pageresponse> list = [];

    /*pages = Pageresponse(name: 'sree', image: Icon(Icons.eleven_mp),);
    list.add(pages);*/
    
  }


  Color selectedColour(int position) {
    Color c = Color(0xFF000000);
    if (position == 0) c = Colors.red;
    if (position == 1) c = Colors.redAccent;
    if (position == 2) c = Colors.red;
    if (position == 3) c = Color(0xFFEF5350);
    if (position == 4) c = Color(0xFFE57373);
    if (position == 5) c = Color(0xFFF9A825);
    if (position == 6) c = Color(0xFFF57F17);
    if (position == 7) c = Color(0xFFFFEB3B);
    return c;
  }

}
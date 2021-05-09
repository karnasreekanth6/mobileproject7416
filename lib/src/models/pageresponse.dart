
import 'package:flutter/cupertino.dart';

class Pageresponse {

  String name;
  Icon image;
  List<Widget> iconss = <Widget>[];


  Pageresponse({required this.name, required this.image,required this.iconss});

  factory Pageresponse.fromjson(Map<String, dynamic> jsonMap){
    final data = Pageresponse(
      name: jsonMap["name"],
      image: jsonMap["image"],
      iconss: jsonMap["iconss"],
    );
    return data;
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'iconss': iconss,
    };
  }





}

class Personresponse{


  int id;
  String name;
  String timeinfo;
  String color;

  Personresponse({required this.id, required this.name, required this.timeinfo, required this.color});

  factory Personresponse.fromjson(Map<String, dynamic> jsonMap){
    final data = Personresponse(
      id: jsonMap["id"],
      name: jsonMap["name"],
      timeinfo: jsonMap["timeinfo"],
      color: jsonMap["color"],
    );
    return data;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'timeinfo': timeinfo,
      'color': color,
    };
  }




}

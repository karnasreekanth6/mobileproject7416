
import 'package:moble_programingapp/src/models/Personsresponse.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Sqlitescreen {

  Sqlitescreen();


  static final _databaseName = "mobilepro";
  static final _databaseVersion = 1;

  Sqlitescreen._privateConstructor();
  static final Sqlitescreen instance = Sqlitescreen._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _database = null;

  Future<Database?> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }
  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE persons(id INTEGER, name TEXT,timeinfo TEXT,color TEXT)",
    );
  }

  Future<int> saveperson(Personresponse personresponse,String tablename) async {
    var dbClient = await database;
    var result = dbClient!.insert(tablename, personresponse.toMap());
    return result.whenComplete(() => true??false);
  }

  Future<List<Personresponse>> savepersonslist(List<Personresponse> personresponse,String tablename) async {
    List<Personresponse> listRes = [];
    var res;
    try{
      var dbClient = await database;
      personresponse.forEach((obj) async{
        try{
          var iRes = await dbClient!.insert(tablename, obj.toMap());
          listRes.add(obj);
        }catch(e){
          print(e);
        }
      });
      res = listRes;
    }catch(e){
      print(e);
    }
    return res;
  }

  delete(int id) async {
    final db = await database;
    db!.delete("persons", where: "id = ?", whereArgs: [id]);
  }

  Future<int> deletoneeuser(int id) async {
    final db = await database;
    return await db!.delete("persons", where: "id = ?", whereArgs: [id]);
  }

  Future<List<Personresponse>> getpersonlist(String tablename) async{
    List<Personresponse> response = [];
    try{
      var dbClient = await database;
      var result = await dbClient!.rawQuery('SELECT * FROM $tablename');
      if(!result.isEmpty){
        result.forEach((element) {
          response.add(Personresponse.fromjson(element));
        });
      }else{
        response = [];
      }
    }catch (e){
      print(e);
    }
    return response;
  }

  Future<int> deleteuser() async {
    final db = await database;
    return await db!.delete('persons');
  }


}
// Get a location using getDatabasesPath
import 'package:flutter_todo/database/databasepopulate.dart';
import 'package:flutter_todo/models/Exercise.dart';
import 'package:flutter_todo/models/Group.dart';
import 'package:flutter_todo/models/belongsIn.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBProvider{

  static Database database = createDatabase();
  
  static getDatabase(){
    if(database != null)
      return database;

    else{
      database = createDatabase();
      return database;
    }
  }

  static createDatabase() async{
    var databasesPath = await getApplicationDocumentsDirectory();
    String dbPath = join(databasesPath.path, 'demo1.db');

    var db = await openDatabase(dbPath, version: 1, onCreate: populateDb);
    return db;
  }

// Delete the database
  static deleteDatabase() async {
    await deleteDatabase();
  }

// Populate the badboy
  static void populateDb(Database database, int version) async {
    await database.execute("CREATE TABLE $Exercise ("
          "id TEXT PRIMARY KEY,"
          "name TEXT,"
          "type TEXT,"
          "pre TEXT,"
          "suf TEXT"
          ");"
    "CREATE TABLE Group ("
          "name TEXT PRIMARY KEY"
          ");"
    "CREATE TABLE IsInGroup ("
          "id TEXT PRIMARY KEY,"
          "name TEXT PRIMARY KEY,"
          "id TEXT references Exercise(id),"
          "name TEXT references Group(name)"
          ")");
    PopulateDB.populateExercises();
} 

  // Insert some records in a transaction
  static createExercise(Exercise exercise) async {
    final db = database;
      var result = await db.rawInsert(
        "INSERT INTO $Exercise (id,name,type,pre,suf)"
        " VALUES (${exercise.id},${exercise.name},${exercise.type},${exercise.pref},${exercise.suf})");
  }

  static createGroup(Group group) async{
    final db = database;
    await db.rawInsert(
      "INSERT INTO $Group (name)"
      " VALUES (${group.name})");
  }

   

  static belongsInGroup(BelongsIn belongsIn) async{
    final db = database;
    var result = await db.rawInsert(
      "INSERT INTO IsInGroup (id,name)"
      " VALUES (${belongsIn.id},${belongsIn.name})");
  }

  // get Exercise
  getExercise(String id) async {
    final db = database;
    var res = await db.query("Exercise", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Exercise.fromJson(res.first) : Null;
  }

  static getAllExercisesPerGroup(String groupName) async {
      final db = await database;
      var res = await db.query("Exercise natural join IsInGroup", where: "Group.name = ?", whereArgs: [groupName]);
      List<Exercise> list =
          res.isNotEmpty ? res.map((c) => Exercise.fromJson(c)).toList() : [];
      return list;
    }

  closeDatabase() async{
    await database.close();
  }


}
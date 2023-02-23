import 'package:lecturepractice/Modelclass.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'Modelclass.dart';
class DatabaseHelper {
  //Declaration of all Variables
  static final _databaseName = "MyDatabse.db";
  static final _databaseVersion = 1;
  static final tableName = "MyTable";
  static final columnId = 'Id';
  static final columnName = 'Name';
  static final columnAge = 'Age';
  var result;

  //named constructor
  //Singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  //database variable
  static Database? _database;

  //Create database method
  //openDatabase :- sqflite
  //join :- path package
  static Future<Database?> get database async {
    final databasePath = await getDatabasesPath();

    final status = await databaseExists(databasePath);
    if (status!=null) {
      _database = await openDatabase(join(databasePath, _databaseName),
          onCreate: (database, version) {
        return database.execute("CREATE TABLE $tableName("
            "$columnId INTEGER PRIMARY KEY AUTOINCREMENT, "
            "$columnName TEXT, "
            "$columnAge TEXT)");
      }, version: _databaseVersion);
    }
    else{
      print("No insert");
    }
    return _database;
  }
    //Insert operation on database
    Future<bool> insert({required Person person}) async {
      try {
        final db = await database;
        db?.insert(tableName, person.toMap());
      }
      catch (stackTrace) {
        print(stackTrace);
      }
      return true;
    }
  //query for all rows (Read Operation)
  //  Future<Person> queryAllRows() async{
  //    Database? db = await database;
  //    result = await db?.query(tableName);
  //    return result.toList() ;
  //  }

  Future<List<Person>> getPerson() async {
            Database? db = await database;
            List<Map> list = await db!.rawQuery('SELECT * FROM PERSON');
            List<Person> Person = [];
            for(int i = 0;)

  }

   //Update operation
   Future<int> updateStatic (Map<String,dynamic>? row,String? table,String? id) async {
      Database? db = await database;
      return await db!.update(table!,row!,where: '$columnId = ?',whereArgs: [id]);
   }

   //Delete operation
   Future<int> delete (int id) async{
      Database? db = await database;
      return await db!.delete(tableName,where: '$columnId = ?',whereArgs: [id]);
   }
}



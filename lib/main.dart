import 'package:flutter/material.dart';
import 'package:lecturepractice/database_helper.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final dbHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  Map<String, dynamic> row = {
                    DatabaseHelper.columnName: "Shreya",
                    DatabaseHelper.columnAge: "21",
                  };
                  // Map<String,dynamic>  insertedData = Map.from(row);
                  final isInserted = await dbHelper.insert(row);

                  print("Insert ${isInserted}");
                },
                child: Text("Insert")),
            ElevatedButton(
                onPressed: () async {
                  final list = await dbHelper.queryAllRows();
                  print(list);
                },
                child: Text("Read")),
            ElevatedButton(onPressed: () async{
               Map<String,dynamic> updateRow = {
                 DatabaseHelper.columnName : "Krish",
                 DatabaseHelper.columnAge : "14",
               };
               final updated = await dbHelper.updateStatic( updateRow, DatabaseHelper.tableName, "5");
               print(updated);
            }, child: Text("Update")),
            ElevatedButton(onPressed: () async {
              final deleted = await  dbHelper.delete(1);
              print(deleted);
            }, child: Text("Delete")),
          ],
        ),
      ),
    );
  }
}

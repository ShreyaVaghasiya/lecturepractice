import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lecturepractice/database_helper.dart';
void main()
{
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    )
  );
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
         body: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             ElevatedButton(onPressed: ()async{
                 log("Insert Stared || ");
                 Map<String,dynamic> row = {
                   DatabaseHelper.columnName : "Shreya",
                   DatabaseHelper.columnAge : "21",
                 };
                 // Map<String,dynamic>  insertedData = Map.from(row);
                 final isInserted = await dbHelper.insert(row);

                 print("Insert ${isInserted}");
                 log("Insert Completed || ");

             }, child: Text("Insert")),
             ElevatedButton(onPressed: () async{
               print('|| Read Started');
               final list = await dbHelper.queryAllRows();
               print(list);
               print("|| Red Completed");
             }, child: Text("Read")),
           ],
         ),
    );
  }
}

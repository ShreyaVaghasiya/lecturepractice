import 'package:flutter/material.dart';
import 'package:lecturepractice/Modelclass.dart';
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       ElevatedButton(
      //           onPressed: () async {
      //            dbHelper
      //                 .insert(person: Person( name: "Princy", age: 20));
      //           },
      //           child: Text("Insert")),
      //       ElevatedButton(
      //           onPressed: () async {
      //             final list = await dbHelper.queryAllRows();
      //             print(list);
      //           },
      //           child: Text("Read")),
      //       ElevatedButton(
      //           onPressed: () async {
      //             Map<String, dynamic> updateRow = {
      //               DatabaseHelper.columnName: "Krish",
      //               DatabaseHelper.columnAge: "14",
      //             };
      //             final updated = await dbHelper.updateStatic(
      //                 updateRow, DatabaseHelper.tableName, "5");
      //             print(updated);
      //           },
      //           child: Text("Update")),
      //       ElevatedButton(
      //           onPressed: () async {
      //             final deleted = await dbHelper.delete(1);
      //             print(deleted);
      //           },
      //           child: Text("Delete")),
      //     ],
      //   ),
      // ),
      appBar: AppBar(
        title:  ElevatedButton(
            onPressed: () async {
              dbHelper
                  .insert(person: Person( name: "Princy", age: 20));
            },
            child: Text("Insert")),
      ),
      body: FutureBuilder(
        future: dbHelper.queryAllRows(),
        builder: (BuildContext context, AsyncSnapshot<List<Person>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
              return ListTile(
                title: Text(snapshot.data![index].id.toString()),
              );
            });
          }
          else{
                 return CircularProgressIndicator();
          }
        }
      ),
    );
  }
}

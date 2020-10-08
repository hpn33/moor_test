import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/moor_database.dart';
import 'ui/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final db = AppDatabase();

    print(db.select(db.persons).get());

    return MultiProvider(
      providers: [
        Provider<TaskDao>(create: (BuildContext context) => db.taskDao),
        Provider<TagDao>(create: (BuildContext context) => db.tagDao),
      ],
      child: MaterialApp(
        title: 'Material App',
        home: HomePage(),
      ),
    );
  }
}

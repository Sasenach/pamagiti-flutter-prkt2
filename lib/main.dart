import 'package:autocar/lets_go_page.dart';
import 'package:flutter/material.dart';

import 'core/db/data_base_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DataBaseHelper.instance.database;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LetsGoPage(),
    );
  }
}

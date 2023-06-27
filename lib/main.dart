import 'package:flutter/material.dart';
import 'package:recet_iav2/views/home.dart';

void main() {
   // derepente borrar esto el const
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  // derepente borrar esto
  // const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RecetIA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(        
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      home: HomePage(),
    );
  }
}

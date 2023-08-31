import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recet_iav2/providers/chats_provider.dart';
import 'package:recet_iav2/providers/models_provider.dart';
import 'package:recet_iav2/views/home.dart';
import 'package:recet_iav2/views/recipe_details.dart';
import 'package:recet_iav2/views/singin_screen.dart';
import 'package:recet_iav2/views/splash.dart';

import 'consent/navigation.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_)=> ModelsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_)=> ChatProvider(),
        ),
      ],
      child: const MaterialApp(
        // title: 'RecetIA',
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(        
        //   primarySwatch: Colors.blue,
        //   primaryColor: Colors.blue,
        //   textTheme: TextTheme(
        //     bodyText2: TextStyle(color: Colors.white),
        //   ),
        // ),
        //home: Navigation()
        home: SingInScreen(),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../views/widgets/drawer.dart';
import 'colors.dart';

PreferredSizeWidget appBar(){
  return AppBar(
        elevation: 0,
        title:
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Icon(Icons.restaurant_menu),
          SizedBox(width: 10),
          Text('RecetIA')
        ]
        ),

          actions: [
            CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage('images/p3.jpg'),
            ),
          ],

          // drawer: const MyDrawer(),

          // leading: IconButton(onPressed: () {},
          // icon: IconButton(
          //   icon: const Icon(Icons.menu,size: 27,), onPressed: () {
              
          //   },
          // ),
          // ),

        backgroundColor: maincolor,

      );
}

PreferredSizeWidget appBarProfile(){
  return AppBar(
        // elevation: 0,
        title:
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80.0),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Icon(Icons.restaurant_menu),
            SizedBox(width: 10),
            Text('Perfil')
          ]
          ),
        ),

          // actions: [
          //   CircleAvatar(
          //     radius: 18,
          //     backgroundImage: AssetImage('images/p3.jpg'),
          //   ),
          // ],

          // drawer: const MyDrawer(),

          // leading: IconButton(onPressed: () {},
          // icon: IconButton(
          //   icon: const Icon(Icons.menu,size: 27,), onPressed: () {
              
          //   },
          // ),
          // ),

        backgroundColor: maincolor,

      );
}

PreferredSizeWidget appBarFavorite(){
  return AppBar(
        elevation: 0,
        title:
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
          Icon(Icons.restaurant_menu),
          SizedBox(width: 10),
          Text('Favoritos')
        ]
        ),

          actions: const [
            CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage('images/p3.jpg'),
            ),
          ],

          // drawer: const MyDrawer(),

          // leading: IconButton(onPressed: () {},
          // icon: IconButton(
          //   icon: const Icon(Icons.menu,size: 27,), onPressed: () {
              
          //   },
          // ),
          // ),

        backgroundColor: maincolor,

      );
}
import 'package:flutter/material.dart';
import 'package:recet_iav2/views/widgets/my_list_tile.dart';

import '../../consent/colors.dart';
import '../../consent/navigation.dart';

class MyDrawer extends StatelessWidget {
  final void Function() onProfileTap;
  final void Function() onSignOut;

  const MyDrawer({
    this.onProfileTap,
    this.onSignOut,
    Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 153, 247, 156),
      // backgroundColor: Color.fromARGB(255, 237, 223, 223),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
          children: [
            //header
          DrawerHeader(
            child: Container(
              decoration: BoxDecoration(
                  color: maincolor,
                  border: Border.all(color: Color.fromARGB(205, 98, 99, 98), width: 2 ),
                  shape: BoxShape.circle,
                  ),
              child: const CircleAvatar(radius: 50,
                backgroundImage: AssetImage('images/p3.jpg'),),
            )
          ),

          //home list title

          MyListTile(
            icon:Icons.home,
            text: 'Inicio',
            onTap: () => 
            Navigator.push(context,
          MaterialPageRoute(
            builder: (context)=> const Navigation(),
          ),
        )
            
            ),

            

            //profile list file
           MyListTile(
            icon:Icons.person,
            text: 'Perfil',
            onTap: onProfileTap),

          ],
          ),
          
            //logout list tile
             Padding(
               padding: const EdgeInsets.only(bottom:25.0),
               child: MyListTile(
            icon:Icons.logout,
            text: 'Salir',
            onTap: onSignOut
            ),
             ),
        ]),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recet_iav2/consent/colors.dart';
import 'package:recet_iav2/views/favorite.dart';
import 'package:recet_iav2/views/home.dart';
import 'package:recet_iav2/views/ia.dart';
import 'package:recet_iav2/views/profile.dart';
import 'package:recet_iav2/views/search.dart';

class Navigation extends StatefulWidget {
  const Navigation({ Key key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int index = 0; // Mueve esta línea dentro de la clase _NavigationState
  List screen = [HomePage(),Ia(),Search(),FavoritePage(),Profil()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            index = 2; 
          });
        },
        child: Icon(FontAwesomeIcons.search),
        backgroundColor: maincolor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: 
      BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 0;
                  });
                },
                child: Icon(
                  FontAwesomeIcons.home,
                  size: 27,
                  color: index == 0 ? maincolor : Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 1;
                  });
                },
                child: Icon(
                  FontAwesomeIcons.robot,
                  size: 27,
                  color: index == 1 ? maincolor : Colors.grey,
                ),
              ),
              SizedBox(width: 10,),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 3;
                  });
                },
                child: Icon(
                  FontAwesomeIcons.heart,
                  size: 27,
                  color: index == 3 ? maincolor : Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 4;
                  });
                },
                child: Icon(
                  FontAwesomeIcons.user,
                  size: 27,
                  color: index == 4 ? maincolor : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
      body: screen[index],
    );
  }
}

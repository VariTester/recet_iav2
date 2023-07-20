import 'package:flutter/material.dart';
import 'package:recet_iav2/consent/colors.dart';
class login extends StatelessWidget {
  const login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 120,),
            Center(child: Text('Login',
            style: TextStyle(
          color: font,
          fontFamily: 'ro',
          fontSize: 26,
          fontWeight: FontWeight.bold,
          ),
          ),
          ),
          SizedBox(height: 40,),
          Container(
            color: Colors.white,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          )
          ],
        ),
      ),
    );
  }
} 
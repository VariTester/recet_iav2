import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget {
  final String userName;
  final String textUserName;
  final void Function() onPressed;

  const MyTextBox({
    this.userName,
    this.textUserName,
    this.onPressed,
    Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10)
      ),
      padding: const EdgeInsets.only(
        left: 15,
        bottom: 15,
      ),
      margin: const EdgeInsets.only(left: 20,right: 20,top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
              //Textusername
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: 
                Text(textUserName,
                style:TextStyle(color: Colors.grey[500]),
                ),
              ), 
              //edit Name


          //Username
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(userName,
                style:TextStyle(color: Colors.grey[800]),
                ),

                  IconButton(
                  onPressed: onPressed,
                  icon: Icon(Icons.settings,
                  color: Colors.grey[600],
                  ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
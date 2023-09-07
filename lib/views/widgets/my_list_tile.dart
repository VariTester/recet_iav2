import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final void Function() onTap;
  const MyListTile({
    this.onTap,
    this.icon,
    this.text,
    Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.black,
        ),
        onTap: onTap,
        title: Text(text),
      ),
    );
  }
}
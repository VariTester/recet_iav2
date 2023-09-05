
import 'package:flutter/material.dart';

import '../services/firebase_service.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:recet_iav2/consent/colors.dart';
class Prueba extends StatefulWidget {
  const Prueba({Key key,}) : super(key: key);

  @override
  State<Prueba> createState() => _PruebaState();
}

class _PruebaState extends State<Prueba> {
  @override
  Widget build(BuildContext context) {
    return
  FutureBuilder(
          future: getUsers(),
          builder: ((context, snapshot) {
            if(snapshot.hasData){

            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return Text(snapshot.data[index]['name']);
              },
              );

            }else{
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            // return Text("Hola");
            

          }
          ),
          );
}
  }



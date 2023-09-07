import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:recet_iav2/consent/colors.dart';
import 'package:recet_iav2/views/widgets/text_box.dart';

import '../consent/appbar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  
  //user
  final currentUser = FirebaseAuth.instance.currentUser;

  //all users
  final usersCollection = FirebaseFirestore.instance.collection('users');



  //edit field Usuario
  Future<void>editUserField(String field)async{
    String newValue ="";
    await showDialog(
      context: context,
      builder: (context)=> AlertDialog(
        backgroundColor: Colors.grey[900],
        title: Text(
          "Editar $field",
          style: const TextStyle(color: Colors.white),
          ),
          content: TextFormField(
            autofocus: true,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Ingresar nuevo $field",
              hintStyle: const TextStyle(color: Colors.grey),
              
            ),
            
            onChanged: (value) {
              newValue = value;
            },
            inputFormatters: [
          LengthLimitingTextInputFormatter(20),
          FilteringTextInputFormatter.allow(RegExp(r'[aA-zZ ]')),
          FilteringTextInputFormatter.deny(RegExp(r'[0-9]')),
          FilteringTextInputFormatter.deny(RegExp(r'[_]')) 
            ],
            // validator: (value) {
              
            // },
          ),
          actions: [
            //cancel button
            TextButton(
              child: Text('Cancelar', style: TextStyle(color: Colors.white),),
              onPressed: () => Navigator.pop(context),
            ),
            //save button
              TextButton(
              child: Text('Guardar', style: TextStyle(color: Colors.white),),
              onPressed: () => Navigator.of(context).pop(newValue),
            )
          ],
      ),
      );
      //updating in firestore
      if(newValue.trim().isNotEmpty){
        //only update if there is something in the textfieild
        await usersCollection.doc(currentUser.uid).update({field:newValue});
      }else{
            ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('No ingresaste tu nuevo nombre'),
            behavior: SnackBarBehavior.floating, // Establece el comportamiento como flotante
            margin: EdgeInsets.only(bottom: 80.0),
            backgroundColor: Colors.red,
            )
          );

      }
  }
  // editar numero
    Future<void>editNumberField(String field)async{
    String newValue ="";
    await showDialog(
      context: context,
      builder: (context)=> AlertDialog(
        backgroundColor: Colors.grey[900],
        title: Text(
          "Editar $field",
          style: const TextStyle(color: Colors.white),
          ),
          content: TextFormField(
            autofocus: true,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Ingresar nuevo $field",
              hintStyle: const TextStyle(color: Colors.grey),
              
            ),
            
            onChanged: (value) {
              newValue = value;
            },
              keyboardType: TextInputType.number, // Configura el teclado para números
              inputFormatters: [
              LengthLimitingTextInputFormatter(9), // Limita la longitud a 9 caracteres
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), // Permite solo dígitos
            ],
          ),
          actions: [
            //cancel button
            TextButton(
              child: Text('Cancelar', style: TextStyle(color: Colors.white),),
              onPressed: () => Navigator.pop(context),
            ),
            //save button
              TextButton(
              child: Text('Guardar', style: TextStyle(color: Colors.white),),
              onPressed: () => Navigator.of(context).pop(newValue),
            )
          ],
      ),
      );
      //updating in firestore
      if(newValue.trim().isNotEmpty){
        if(newValue.trim().length==9){
          //only update if there is something in the textfieild
        await usersCollection.doc(currentUser.uid).update({field:newValue});
        }
      }else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Debes ingresar 9 números'),
            behavior: SnackBarBehavior.floating, // Establece el comportamiento como flotante
            margin: EdgeInsets.only(bottom: 80.0),
            backgroundColor: Colors.red,
            )
          );
        }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarProfile(),
      body: StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection("users")
          .doc(currentUser.uid)
          .snapshots(),
      builder:(context, snapshot) {
          // get user data
          if(snapshot.hasData){
            // final userData = snapshot.data != null ? snapshot.data.data() : null;
            final userData = snapshot.data.data() as Map<String, dynamic>;
          return ListView(
           children:  [
           const Padding(
            padding: EdgeInsets.all(8.0),
            child:
            SizedBox(height: 10,)
//             Align(
//               alignment: Alignment.center,
//               child:
              
// Text("Hola ${currentUser.email}",
//   style: const TextStyle(
//     fontSize: 20,
//     color: Colors.black,
//     fontFamily: 'ro',
//   ),
// )

//             ),

          ),
          //profile pic
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  // color: Colors.black,
                  border: Border.all(color: maincolor, width: 2 ),
                  shape: BoxShape.circle,
                  ),
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: CircleAvatar(
                    radius: 50,
                  backgroundImage: AssetImage('images/p3.jpg'),
            ),
                ),
              ),
              ],
          ),
          const SizedBox(height: 10,),
    

          //user email
          Text(
            currentUser.email,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[700]),
          ),

          const SizedBox(height: 50),

          //Datos Personales
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              'Datos Personales',
              style: TextStyle(color: Colors.grey[600])
            ),
          
          ),

          //userName
//userName
        MyTextBox(
          userName: userData != null ? userData['name'] : '', // Verifica si userData es null
          textUserName: 'Nombre',
          onPressed: () => editUserField('name'),
        ),


          //user posts
          //userName
        MyTextBox(
          userName: userData != null ? userData['phone'] : '', // Verifica si userData es null
          textUserName: 'Celular',
          onPressed: () => editNumberField('phone'),
        ),

          //   MyTextBox(
          //   userName: userData['phone'],
          //   textUserName:'phone',
          //   onPressed: () => editField(),
            
          // ),
          const SizedBox(height: 20),
          //Datos Personales
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              'Datos Personales',
              style: TextStyle(color: Colors.grey[600])
            ),
          ),
          

      ],
      );
      }else if (snapshot.hasError){
        return Center(
          child: Text('Error${snapshot.error}'),
        );
      }
      return const Center(child: CircularProgressIndicator(),);
        }) 
    );
  }
}
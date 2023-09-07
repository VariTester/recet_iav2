import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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



  //edit field
  Future<void> editField()async{

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
          textUserName: 'name',
          onPressed: () => editField(),
        ),


          //user posts
          //userName
        MyTextBox(
          userName: userData != null ? userData['phone'] : '', // Verifica si userData es null
          textUserName: 'phone',
          onPressed: () => editField(),
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
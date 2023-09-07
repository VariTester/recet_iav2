import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recet_iav2/consent/colors.dart';

// import 'package:recet_iav2/views/singin_screen.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

//servicios
// import 'package:recet_iav2/services/firebase_service.dart';

class Profil extends StatefulWidget {
   const Profil({Key key}) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  List<Icon> icons = [
    Icon(FontAwesomeIcons.user, color: maincolor),
    Icon(FontAwesomeIcons.cogs, color: maincolor),
    Icon(FontAwesomeIcons.coffee, color: maincolor),
    Icon(FontAwesomeIcons.infoCircle, color: maincolor),
    Icon(Icons.login, color: maincolor),
  ];

  List titls = [
    'Datos personales',
    'Ajustes',
    'Invitanos un café c:',
    'Acerca de nosotros',
    'Logout'
  ];

  // const userId = FirebaseAuth().currentUser.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(child: Column(
        children: [

          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: maincolor,
                  border: Border.all(color:maincolor, width: 2 ),
                  shape: BoxShape.circle,
                  ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: CircleAvatar(
                    radius: 50,
                  backgroundImage: AssetImage('images/p3.jpg'),
            ),
                ),
              ),
              ],
          ),
              SizedBox(height: 10),
              Text(
                "Charlotte" // Espera a que se obtenga el nombre desde Firestore
                // style: TextStyle(fontSize: 18, color: font, fontFamily: 'ro'),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  height: 40,
                  thickness: 2,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      switch (index) {
                        case 0:
                        Navigator.pushNamed(context, '/datos_personales');
                        break;
                        case 1:
                        Navigator.pushNamed(context, '/ajustes');
                        break;
                        case 2:
                        Navigator.pushNamed(context, '/cafe');
                        break;
                        case 3:
                        Navigator.pushNamed(context, '/acerca_de_nosotros');
                        break;
                        case 4:
                        Navigator.pushNamed(context, '/logout');
                        break;
                      }

                      // Navigator.push(context, MaterialPageRoute(builder: ((context) => const SingInScreen())));
                    },
                    child: ListTile(
                      leading: Container(
                        width: 37,
                        height: 37,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: icons[index],
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(titls[index]),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios_sharp,
                        size: 15,
                        ),
                    ),
                  );
                },
                
              ),

        ],
      ),
      
      ),
      
    );
  }
}

// Future<String> getNameFromFirestore() async {
//   final userId = FirebaseAuth.instance.currentUser.uid;

//   final userDoc = await FirebaseFirestore.instance.collection('users').doc(userId).get();

//   if (userDoc.exists) {
//     final userData = userDoc.data() as Map<String, dynamic>;
//     final name = userData['name'] as String;
//     return name;
//   } else {
//     return 'Nombre no encontrado'; // Puedes manejar este caso según tus necesidades
//   }
// }

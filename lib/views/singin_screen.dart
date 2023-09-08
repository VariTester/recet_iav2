import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recet_iav2/consent/colors.dart';
import 'package:recet_iav2/views/singup_screen.dart';
import 'package:recet_iav2/views/widgets/reusable_widget.dart';
import 'package:recet_iav2/views/widgets/text_widget.dart';

import '../consent/navigation.dart';

class SingInScreen extends StatefulWidget {
  const SingInScreen({Key key}) : super(key: key);

  @override
  State<SingInScreen> createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {
 final TextEditingController _passwordTextController =TextEditingController();
 final TextEditingController _emailTextController =TextEditingController(); 
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringColor("3CB371"),//F6F4FA
              hexStringColor("2E8B57"),
              hexStringColor("228B22"),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
          )
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              20,
              MediaQuery.of(context).size.height*0.2,
              20,
              0),
            child: Column(
              children: <Widget>[
                logoWidget("images/logohd.png"),
                const SizedBox(
                  height: 30,
                ),
                reusableEmailTextField(
                  "Ingresa tu correo electrónico",
                  Icons.person_outline,
                  false,
                  _emailTextController),

                const SizedBox(
                  height: 30,
                ),
                reusablePasswordTextField(
                  "Ingresa tu contraseña",
                  Icons.lock_outline,
                  true,
                  _passwordTextController),           
                const SizedBox(
                  height: 30,
                ),
                sinInSignUpButtom(context, true, (){
                  FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: _emailTextController.text,
                    password: _passwordTextController.text)
                    .then((value) {
                      Navigator.push(context,
                      MaterialPageRoute(builder:((context) => const Navigation())));
                    }).onError((error, stackTrace) {
                      log("error $error");
                       ScaffoldMessenger.of(
                        context).showSnackBar(
                        SnackBar(
                        content: TextWidget(
                        label: error.toString(),
                        // label: "Usuario o contraseña incorrecta :p",
                          ),
                      backgroundColor:Colors.red,
              ),
              );
                    });
                    
                }),
                signUpOption()
          ],
          ),)),

      ),
    );
  }
  Row signUpOption(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        const Text("No tienes una cuenta?",
        style: TextStyle(
          color: Colors.white70)),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
               MaterialPageRoute(builder: (context) => const SignUpScreen()));
            },
            child: const Text(
              " Registrate",
              style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold
              ),
            ),
          )
      ],
    );
  }
}
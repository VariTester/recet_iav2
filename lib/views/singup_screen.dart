import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:recet_iav2/views/singin_screen.dart';
import 'package:recet_iav2/views/widgets/reusable_widget.dart';
import 'package:recet_iav2/views/widgets/text_widget.dart';

import '../consent/colors.dart';
import '../consent/navigation.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _userTextController = TextEditingController();
  final TextEditingController _phoneTextController = TextEditingController();

  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Registrate!",
          style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
        ),
      ),
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
        child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              20, 100, 20, 0),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    reusableUserTextField("Ingrese un nombre de Usuario", Icons.person_outline,false, _userTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableNumberInput("Ingrese su número de celular", Icons.call_end_outlined,false, _phoneTextController),
                     const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Ingrese su correo electrónico", Icons.person_outline,false, _emailTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Ingrese su contraseña", Icons.lock_clock_outlined,true, _passwordTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    sinInSignUpButtom(context, false, (){
                      if(formkey.currentState.validate()){
                        FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: _emailTextController.text.trim(),
                          password: _passwordTextController.text.trim()).then((value){
                            FirebaseFirestore.instance.collection('users').doc(value.user.uid).set({
                              'id':value.user.uid,
                              'name':_userTextController.text,
                              'phone':_phoneTextController.text,
                              'email':_emailTextController.text,
                              'password':_passwordTextController.text,
                            }).onError((error, stackTrace) {
                          log("error $error");
                       ScaffoldMessenger.of(
                        context).showSnackBar(
                        SnackBar(
                        content: TextWidget(
                        label: error.toString(),
                          ),
                      backgroundColor:Colors.red,
              ),
              );
                        });
                          });

              //                                 FirebaseAuth.instance
              //         .createUserWithEmailAndPassword(
              //           email: _emailTextController.text.trim(),
              //           password: _passwordTextController.text.trim())
              //           .then((value) => FirebaseFirestore.instance.collection('users').doc(value.user.uid).get().then((value) {
              //             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const SingInScreen()));
              //           })).onError((error, stackTrace) {
              //             log("error $error");
              //          ScaffoldMessenger.of(
              //           context).showSnackBar(
              //           SnackBar(
              //           content: TextWidget(
              //           label: error.toString(),
              //             ),
              //         backgroundColor:Colors.red,
              // ),
              // );
              //           });
                      }

              //         .then((value){
              //           ScaffoldMessenger.of(
              //           context).showSnackBar(
              //           SnackBar(
              //           content: TextWidget(
              //           // label: error.toString(),
              //           label: "Te has regisitrado con éxito",
              //             ),
              //         backgroundColor:Color.fromARGB(255, 99, 235, 99),
              // ),
              // );
              //             Navigator.push(context,
              //             MaterialPageRoute(builder:(context) => const Navigation()));
              //           });
              //           ).onError((error, stackTrace) {
              //             log("error $error");
              //          ScaffoldMessenger.of(
              //           context).showSnackBar(
              //           SnackBar(
              //           content: TextWidget(
              //           label: error.toString(),
              //             ),
              //         backgroundColor:Colors.red,
              // ),
              // );
              //           });
                    })
                  ],
                ),
                ),),
      )
      );
      
  }
}
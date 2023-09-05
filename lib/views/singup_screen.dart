import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
  // final TextEditingController _passwordTextController = TextEditingController();
  // final TextEditingController _emailTextController = TextEditingController();
  // final TextEditingController _userTextController = TextEditingController();

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
        child: SingleChildScrollView(
        child: Form(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TextFormField(
              //   decoration: const InputDecoration(
              //     label: Text(data)),
              // )
            ],
          )
          ),
        //   child: Padding(
        //     padding: const EdgeInsets.fromLTRB(
        //       20, 120, 20, 0),
        //         child: Column(
        //           children: <Widget>[
        //             const SizedBox(
        //               height: 20,
        //             ),
        //             reusableTextField("Ingrese su nombre de Usuario", Icons.person_outline,false, _userTextController),
        //             const SizedBox(
        //               height: 20,
        //             ),
        //             reusableTextField("Ingrese su Email", Icons.person_outline,false, _emailTextController),
        //             const SizedBox(
        //               height: 20,
        //             ),
        //             reusableTextField("Ingrese su contraseña", Icons.lock_clock_outlined,true, _passwordTextController),
        //             const SizedBox(
        //               height: 20,
        //             ),
        //             sinInSignUpButtom(context, false, (){
        //               FirebaseAuth.instance
        //               .createUserWithEmailAndPassword(
        //                 email: _emailTextController.text,
        //                 password: _passwordTextController.text)
        //               .then((value){
        //                 ScaffoldMessenger.of(
        //                 context).showSnackBar(
        //                 SnackBar(
        //                 content: TextWidget(
        //                 // label: error.toString(),
        //                 label: "Te has regisitrado con éxito",
        //                   ),
        //               backgroundColor:Color.fromARGB(255, 99, 235, 99),
        //       ),
        //       );
        //                   Navigator.push(context,
        //                   MaterialPageRoute(builder:(context) => const Navigation()));
        //                 }).onError((error, stackTrace) {
        //                   log("error $error");
        //                ScaffoldMessenger.of(
        //                 context).showSnackBar(
        //                 SnackBar(
        //                 content: TextWidget(
        //                 label: error.toString(),
        //                   ),
        //               backgroundColor:Colors.red,
        //       ),
        //       );
        //                 });
        //             })
        //           ],
        //         ),
        //         ),),
      ),
      ),
    );
  }
}
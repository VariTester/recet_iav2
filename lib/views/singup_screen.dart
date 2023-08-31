import 'package:flutter/material.dart';
import 'package:recet_iav2/views/widgets/reusable_widget.dart';

import '../consent/colors.dart';
import '../consent/navigation.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userTextController = TextEditingController();

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
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              20, 120, 20, 0),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Ingrese su Contraseña", Icons.person_outline,false, _userTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Ingrese su Email", Icons.person_outline,false, _emailTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Ingrese su contraseña", Icons.lock_clock_outlined,true, _emailTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    sinInSignUpButtom(context, false, (){
                      Navigator.push(context,
                        MaterialPageRoute(builder:(context) => Navigation()));
                    })
                  ],
                ),
                ),),
      ),
    );
  }
}
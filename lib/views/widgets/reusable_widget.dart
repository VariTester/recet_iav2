 import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Image logoWidget(String imageName){
    return Image.asset(
      imageName,
      fit: BoxFit.fitWidth,
      width: 240,
      height: 240,
      // color: Colors.white,
    );
  }

  TextFormField reusableTextField(String text, IconData icon, bool isPasswordType, TextEditingController controller, 
  ){
    return TextFormField(
      controller: controller,
      obscureText: isPasswordType,
      enableSuggestions: !isPasswordType,
      autocorrect: !isPasswordType,
      cursorColor: Colors.white,
      style: TextStyle(
        color: Colors.white.withOpacity(0.9)),
        decoration: InputDecoration(
          prefixIcon: Icon(
          icon, color:  Colors.white70,
          ),
          labelText: text,
          labelStyle: TextStyle(
            color: Colors.white.withOpacity(0.9)),
            filled: true,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            fillColor: Colors.white.withOpacity(0.3),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(
                width: 0,
                style: BorderStyle.none
                ),
            ),
          ),
          keyboardType
          : isPasswordType
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
              validator: (value) {
      if (value.isEmpty) {
        return 'Este campo no puede estar vacío';
      }
      if (value.length != 8) {
        return 'La contraseña debe tener exactamente 8 dígitos';
      }
      // Si la validación pasa, devuelve null
      return null;
    },
          // validator: (value) {
          //   if(){

          //   }
          // },
    );
  }

  Container sinInSignUpButtom (BuildContext context, bool isLogin, Function onTap){
    return Container(
      width: MediaQuery.of(
        context).size.width,height: 50,
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
        child: ElevatedButton(
          onPressed: () {
          onTap();
        },
        child: Text(
          isLogin ? 'LOG IN' : 'SING UP',
          style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16
          ),
        ),
        style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states){
          if(states.contains(MaterialState.pressed)){
            return Colors.black26;
          }
          return Colors.white;
        }),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
        )
        ),
        ),
        );
  }



TextField reusableNumberInput(
  String text,
  IconData icon,
  bool isPasswordType,
  TextEditingController controller,
) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(
      color: Colors.white.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon, 
        color:  Colors.white70,
      ),
      labelText: text,
      labelStyle: TextStyle(
        color: Colors.white.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(
          width: 0,
          style: BorderStyle.none,
        ),
      ),
    ),
    keyboardType: TextInputType.number, // Configura el teclado para números
    // inputFormatters: <TextInputFormatter>[
    //   FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), // Permite solo dígitos
    // ],
        inputFormatters: [
      LengthLimitingTextInputFormatter(9), // Limita la longitud a 9 caracteres
      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), // Permite solo dígitos
    ],
  );
}

//PARA EL USER

 TextFormField reusableUserTextField(String text, IconData icon, bool isPasswordType, TextEditingController controller, 
  ){
    return TextFormField(
      controller: controller,
      obscureText: isPasswordType,
      enableSuggestions: !isPasswordType,
      autocorrect: !isPasswordType,
      cursorColor: Colors.white,
      style: TextStyle(
        color: Colors.white.withOpacity(0.9)),
        decoration: InputDecoration(
          prefixIcon: Icon(
          icon, color:  Colors.white70,
          ),
          labelText: text,
          labelStyle: TextStyle(
            color: Colors.white.withOpacity(0.9)),
            filled: true,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            fillColor: Colors.white.withOpacity(0.3),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(
                width: 0,
                style: BorderStyle.none
                ),
            ),
          ),
          keyboardType: TextInputType.text,
          inputFormatters: [
      LengthLimitingTextInputFormatter(9),
      FilteringTextInputFormatter.deny(RegExp(r'[0-0]')) // Limita la longitud a 9 caracteres
      // FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), // Permite solo dígitos
    ],
          // : isPasswordType
          // ? TextInputType.visiblePassword
          // : TextInputType.emailAddress,
              validator: (value) {
      if (value.isEmpty) {
        return 'Este campo no puede estar vacío';
      }
              
      // if (value.length != 8) {
      //   return 'La contraseña debe tener exactamente 8 dígitos';
      // }
      // // Si la validación pasa, devuelve null
      // return null;
    },
          // validator: (value) {
          //   if(){

          //   }
          // },
    );
  }



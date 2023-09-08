 import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Image logoWidget(String imageName){
    return Image.asset(
      imageName,
      fit: BoxFit.fitWidth,
      width: 210,
      height: 210,
      // color: Colors.white,
    );
  }

  TextFormField reusableEmailTextField(String text, IconData icon, bool isPasswordType, TextEditingController controller, 
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
          inputFormatters: [
          LengthLimitingTextInputFormatter(40),
          FilteringTextInputFormatter.allow(RegExp(r'[012345678aA-zZ9@._-]'))
          ],
          validator: (value) {
      if (value.isEmpty) {
        return 'Este campo no puede estar vacío';
      }
      // if(!value.endsWith("@")){}
      // Define una expresión regular para validar varias terminaciones de correo electrónico

      // Convierte la dirección de correo electrónico a minúsculas antes de la validación
        final inputEmail = value.toLowerCase();

        final emailPattern = RegExp(r'@(gmail\.com|hotmail\.com|outlook\.com)$');

      if (!emailPattern.hasMatch(inputEmail)) {
        return 'Por favor, ingresa una dirección de correo válida';
      }

      // Ahora, puedes usar `inputEmail` para almacenar en minúsculas en tu base de datos o en otros lugares.



      // final emailPattern = RegExp(r'@(gmail\.com|hotmail\.com|outlook\.com)$'.toLowerCase());
      // if (!emailPattern.hasMatch(value)) {
      //   return 'Por favor, ingresa una dirección de correo válida';
      // }
      // Si la validación pasa, devuelve null
      return null;
    },
    );
  }
  //La contraseña
  TextFormField reusablePasswordTextField(String text, IconData icon, bool isPasswordType, TextEditingController controller, 
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
          inputFormatters: [
          LengthLimitingTextInputFormatter(20),
          FilteringTextInputFormatter.deny(RegExp(r'[ ]'))
          ],
          validator: (value) {
      if (value.isEmpty) {
        return 'Este campo no puede estar vacío';
      }
      if(value.length<=5){
        return 'La contraseña debe tener más de 5 dígitos';
      }
        if (!value.contains(RegExp(r'[A-Z]')) || !value.contains(RegExp(r'[a-z]'))) {
        return 'La contraseña debe contener letras mayúsculas';
  }
        if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
        return 'La contraseña debe contener al menos un carácter especial.';
    }
        if (!value.contains(RegExp(r'[0-9]'))) {
        return 'La contraseña debe contener al menos un número.';
  }
      // Si la validación pasa, devuelve null
      return null;
    },
    );
  }
// el boton
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
          isLogin ? 'Entrar' : 'Registrarse',
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


//Campo de numeros
TextFormField reusableNumberInput(
  String text,
  IconData icon,
  bool isPasswordType,
  TextEditingController controller,
) {
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
        inputFormatters: [
      LengthLimitingTextInputFormatter(9), // Limita la longitud a 9 caracteres
      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), // Permite solo dígitos
    ],
    validator: (value) {
      if (value.isEmpty) {
        return 'Este campo no puede estar vacío';
      }
            if (value.length<9) {
        return 'Te faltan números';
      }
      // // Si la validación pasa, devuelve null
      return null;
    },
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
          LengthLimitingTextInputFormatter(20),
          FilteringTextInputFormatter.allow(RegExp(r'[aA-zZ ]')),
          FilteringTextInputFormatter.deny(RegExp(r'[0-9]')),
          FilteringTextInputFormatter.deny(RegExp(r'[_]')) // Limita la longitud a 9 caracteres
    ],
      validator: (value) {
      if (value.isEmpty) {
        return 'Este campo no puede estar vacío';
      }
      // // Si la validación pasa, devuelve null
      return null;
    },
    );
  }



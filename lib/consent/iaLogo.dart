import 'package:flutter/material.dart';

class IALogoIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      '/images/icon/bot.png', // Ruta de la imagen en la carpeta de assets
      width: 24, // Ancho deseado del icono
      height: 24, // Altura deseada del icono
    );
  }
}

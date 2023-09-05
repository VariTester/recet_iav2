import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> guardarDatosUsuario() async {
  try {
    // Obtén el usuario autenticado actual
    User user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Accede a la colección "usuarios" en Firestore y crea un documento con el ID de usuario
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        "nombre": "Nombre del usuario",
        "correo": user.email,
        // Otros datos del usuario aquí
      });

      print("Documento de usuario creado en Firestore");
    } else {
      print("No se ha iniciado sesión. No se pudo guardar los datos del usuario.");
    }
  } catch (error) {
    print("Error al crear documento de usuario en Firestore: $error");
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_casa/src/App.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  //Se asegura que se vinculan los widgets al sistema
  WidgetsFlutterBinding.ensureInitialized();


  //Inicializa la app con firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  /*
  //Sirve para guardar las credenciales del usuario y si hay cambios en ello
  //Pero es poco funcional
  FirebaseAuth.instance
      .authStateChanges()
      .listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
   */


  runApp(const App());
}

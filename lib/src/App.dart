

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_casa/src/custom_views/NameBox.dart';
import 'package:flutter_chat_casa/src/login_views/LoginPhoneView.dart';
import 'package:flutter_chat_casa/src/login_views/LoginView.dart';
import 'package:flutter_chat_casa/src/login_views/RegisterView.dart';

import 'home_views/HomeView.dart';

class App extends StatelessWidget{
  //Para sacar al usuario
  //FirebaseAuth.instance.signOut();

  const App({Key? key}) : super(key:key);

  //Esto comprueba si existe el usuario porque lo guarda
  String getInitialRoute() {
    //Si es nulo se va a login
    if(FirebaseAuth.instance.currentUser==null) {
      return '/loginphoneview';
    }
    //Si hay datos se va al else y el home
    else{
      return '/home';
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    
    return MaterialApp(
      //Desde la raiz debemos permitir enrutarlo, para eso esta routes
      title: "Chatdar",

      initialRoute: getInitialRoute(),
      routes: {
        '/home': (context) => HomeView(),
        '/loginphoneview': (context) => LoginPhoneView(),
        '/loginview': (context) => const LoginView(),
        '/registerview': (context) => RegisterView(),
      },
    );
  }
}
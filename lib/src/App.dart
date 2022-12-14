

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_casa/src/home_views/ChatView.dart';
import 'package:flutter_chat_casa/src/home_views/OnBoardingView.dart';
import 'package:flutter_chat_casa/src/login_views/LoginPhoneView.dart';
import 'package:flutter_chat_casa/src/login_views/LoginView.dart';
import 'package:flutter_chat_casa/src/login_views/RegisterView.dart';
import 'package:flutter_chat_casa/src/login_views/SVLogoWait.dart';
import 'package:flutter_chat_casa/src/singleton/DataHolder.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'home_views/HomeView.dart';

class App extends StatelessWidget{
  //Para sacar al usuario
  //FirebaseAuth.instance.signOut();

  App({Key? key}) : super(key:key);

  FirebaseFirestore db = FirebaseFirestore.instance;
  //Esto comprueba si existe el usuario porque lo guarda
  String getInitialRoute() {
    //Si es nulo se va a login
    if(FirebaseAuth.instance.currentUser==null) {
      return '/LoginView';
    }
    //Si hay datos se va al else y el home
    else{
      //FirebaseAuth.instance.signOut();
      Fluttertoast.showToast(
        msg: "Bienvenido a la app: " + FirebaseAuth.instance.currentUser!.email!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 20,
      );
      return '/OnBoarding';
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    MaterialApp materialAppMobile = MaterialApp();
    if(DataHolder().platformAdmin.isAndroidPlatform() || DataHolder().platformAdmin.isIOSPlatform()) {
      materialAppMobile = MaterialApp(
        //Desde la raiz debemos permitir enrutarlo, para eso esta routes
        //title: "/Splash",

        //initialRoute: getInitialRoute(),
        initialRoute: "/Splash",
        routes: {
          '/Home': (context) => HomeView(),
          '/LoginPhoneView': (context) => LoginPhoneView(),
          '/LoginView': (context) => const LoginView(),
          '/RegisterView': (context) => RegisterView(),
          '/OnBoarding': (context) => OnBoardingView(),
          '/ChatView': (context) => ChatView(),
          '/Splash': (context) => SVLogoWait("assets/images/logo2.png"),
        },
      );
    }
    else if(DataHolder().platformAdmin.isWebPlatform()) {
      materialAppMobile = MaterialApp(
        //Desde la raiz debemos permitir enrutarlo, para eso esta routes
        //title: "/Splash",

        //initialRoute: getInitialRoute(),
        initialRoute: "/Splash",
        routes: {
          '/Home': (context) => HomeView(),
          '/LoginPhoneView': (context) => LoginPhoneView(),
          '/LoginView': (context) => const LoginView(),
          '/RegisterView': (context) => RegisterView(),
          '/OnBoarding': (context) => OnBoardingView(),
          '/ChatView': (context) => ChatView(),
          '/Splash': (context) => SVLogoWait("assets/images/logo.jpg"), //Permite usar un logo cada uno
        },
      );
    }

    return materialAppMobile;
  }
}
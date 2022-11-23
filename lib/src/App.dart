

import 'package:flutter/material.dart';
import 'package:flutter_chat_casa/src/custom_views/NameBox.dart';
import 'package:flutter_chat_casa/src/login_views/LoginPhoneView.dart';
import 'package:flutter_chat_casa/src/login_views/LoginView.dart';
import 'package:flutter_chat_casa/src/login_views/RegisterView.dart';

class App extends StatelessWidget{
  
  const App({Key? key}) : super(key:key);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    
    return MaterialApp(
      //Desde la raiz debemos permitir enrutarlo, para eso esta routes
      title: "Chatdar",
      initialRoute: '/loginphoneview',
      routes: {
        '/loginphoneview': (context) => LoginPhoneView(),
        '/loginview': (context) => const LoginView(),
        '/registerview': (context) => RegisterView(),
      },
    );
  }
}
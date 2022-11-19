

import 'package:flutter/material.dart';
import 'package:flutter_chat_casa/src/custom_views/NameBox.dart';
import 'package:flutter_chat_casa/src/login_views/LoginView.dart';

class App extends StatelessWidget{
  
  const App({Key? key}) : super(key:key);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    
    return MaterialApp(
      title: "Nombre de la app",
      home: LoginView()
    );
  }
}
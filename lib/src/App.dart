

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_casa/src/custom_views/NameBox.dart';

class App extends StatelessWidget{
  
  const App({Key? key}) : super(key:key);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    
    return MaterialApp(
      title: "Nombre de la app",
      home: Scaffold(
        appBar: AppBar( //Muestra la barra superior
          title: Text("Hola flutter chat"),
        ),
        backgroundColor: Colors.amber,
        body: Center( //Alinea el texto al centro
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NameBox(name: "Fito"),
              SizedBox(height: 8.0),
              NameBox(name: "Marea"),
              SizedBox(height: 8.0),
              NameBox(name: "Desakato"),
              SizedBox(height: 8.0),
              NameBox(name: "La Raiz"),
            ],
          ),
        ),
      ),
    );
  }
}
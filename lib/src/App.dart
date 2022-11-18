

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          widthFactor: 0.4,
          heightFactor: 0.6,
          child: Column(
            children: [
              Text("Un texto")
            ],
          ),
        ),
      ),
    );
  }
}
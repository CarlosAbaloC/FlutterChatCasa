



import 'package:flutter/material.dart';

import '../custom_views/NameBox.dart';

class LoginView extends StatelessWidget{

  const LoginView({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();

    return Scaffold(
      appBar: AppBar( //Muestra la barra superior
        title: Text("Ventana login"),
      ),
      backgroundColor: Colors.amber,
      body: Center( //Alinea el texto al centro
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

          ],
        ),
      ),
    );
  }
}
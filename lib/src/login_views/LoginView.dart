



import 'package:flutter/material.dart';
import 'package:flutter_chat_casa/src/custom_views/RFInputText.dart';

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
            RFInputText(
              iLongitudPalabra: 12, //Se puede o no definir, si no, usa el valor por defecto
              sHelperText: "Inserte su usuario",
              sTitulo: "Usuario",
              icIzquierda: Icon(Icons.account_circle_outlined),
              icDerecha: Icon(Icons.check_circle),
            ),
            RFInputText(
              iLongitudPalabra: 12, //Se puede o no definir, si no, usa el valor por defecto
              sHelperText: "Inserte su contraseña",
              sTitulo: "Contraseña",
              icIzquierda: Icon(Icons.account_circle_outlined),
              icDerecha: Icon(Icons.check_circle),
            ),
          ],
        ),
      ),
    );
  }
}
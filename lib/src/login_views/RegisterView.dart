

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../custom_views/RFInputText.dart';

class RegisterView extends StatelessWidget{

  const RegisterView({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();

    return Scaffold(
      appBar: AppBar( //Muestra la barra superior
        title: Text("Ventana registro"),
      ),
      //backgroundColor: Colors.white38,
      body: Center( //Alinea el texto al centro
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RFInputText(
                iLongitudPalabra: 12, //Se puede o no definir, si no, usa el valor por defecto
                sHelperText: "Inserte su usuario",
                sTitulo: "Usuario",
                icIzquierda: Icon(Icons.account_circle_outlined)
            ),
            RFInputText(
                iLongitudPalabra: 12, //Se puede o no definir, si no, usa el valor por defecto
                sHelperText: "Inserte su contraseña",
                sTitulo: "Contraseña",
                icIzquierda: Icon(Icons.password)
            ),
            RFInputText(
                iLongitudPalabra: 12, //Se puede o no definir, si no, usa el valor por defecto
                sHelperText: "Repita su contraseña",
                sTitulo: "Repetir contraseña",
                icIzquierda: Icon(Icons.password)
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, //Los coloca a distancia
              children: [
                OutlinedButton(
                    onPressed: () {
                      print("------------>>>>>>Aceptar");
                    },
                    child: Text("Aceptar")
                ),
                OutlinedButton(
                    onPressed: () {
                      print("------------>>>>>>Cancelar");
                      Navigator.of(context).popAndPushNamed('/loginview');
                    },
                    child: Text("Cancelar")
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
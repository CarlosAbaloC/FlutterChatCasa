



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
              icIzquierda: Icon(Icons.account_circle_outlined)
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, //Los coloca a distancia
              children: [
                OutlinedButton(
                    onPressed: () {
                    print("------------>>>>>>LOGIN");
                    },
                    child: Text("Login")
                ),
                OutlinedButton(
                    onPressed: () {
                      //Navigator.of(context).pushNamed('/registerview');
                      //Con esta opcion no elimina la anterior, se apilan las ventanas
                      Navigator.of(context).popAndPushNamed('/registerview');
                      print("------------>>>>>>Registro");
                    },
                    child: Text("Registro")
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_chat_casa/src/custom_views/RFInputText.dart';

import '../custom_views/NameBox.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginView extends StatelessWidget{

  const LoginView({Key? key}) : super(key:key);


  void loginPressed(String emailAddress, String password, BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );
      print("Me loguee");
      Navigator.of(context).popAndPushNamed('/OnBoarding');

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();

    RFInputText inputUser = RFInputText(
        iLongitudPalabra: 20, //Se puede o no definir, si no, usa el valor por defecto
        sHelperText: "Inserte su usuario",
        sTitulo: "Usuario",
        icIzquierda: Icon(Icons.account_circle_outlined)
    );

    RFInputText inputPass = RFInputText(
        iLongitudPalabra: 20, //Se puede o no definir, si no, usa el valor por defecto
        sHelperText: "Inserte su contraseña",
        sTitulo: "Contraseña",
        icIzquierda: Icon(Icons.account_circle_outlined),
        //Cambia el bl de false a true
        blIsPasswordInput: true,
    );


    return Scaffold(
      appBar: AppBar( //Muestra la barra superior
        title: Text("Ventana login"),
      ),
      //backgroundColor: Colors.white38,
      body: Center( //Alinea el texto al centro
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            inputUser,
            inputPass,

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, //Los coloca a distancia
              children: [
                OutlinedButton(
                    onPressed: () {

                      print("------------>>>>>>LOGIN " + inputUser.getText() + " " + inputPass.getText());
                      loginPressed(inputUser.getText(), inputPass.getText(), context);

                    },
                    child: Text("Login")
                ),
                OutlinedButton(
                    onPressed: () {
                      //Navigator.of(context).pushNamed('/registerview');
                      //Con esta opcion no elimina la anterior, se apilan las ventanas
                      Navigator.of(context).popAndPushNamed('/RegisterView');
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
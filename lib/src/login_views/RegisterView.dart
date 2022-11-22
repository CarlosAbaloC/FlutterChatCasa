

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../custom_views/RFInputText.dart';

class RegisterView extends StatelessWidget{

  RegisterView({Key? key}) : super(key:key);

  //Para introducir el texto necesitas un controler
  var txt = TextEditingController();

  //Hacerlo async es para que espere a la funcion acabe
  void registerPressed(String emailAddress, String password, BuildContext context) async{
    try {
      //await tambien obliga a detenerse
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      Navigator.of(context).popAndPushNamed('/loginview');

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        //print('The account already exists for that email.');
        txt.text="USUARIO YA EXISTE PRUEBA A RECUPERAR LA CONTRASEÑA";
      }
    } catch (e) {
      print(e);
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
      icIzquierda: Icon(Icons.password),
      blIsPasswordInput: true,
    );
    RFInputText inputPassRep = RFInputText(
      iLongitudPalabra: 20, //Se puede o no definir, si no, usa el valor por defecto
      sHelperText: "Repita su contraseña",
      sTitulo: "Repetir contraseña",
      icIzquierda: Icon(Icons.password),
      blIsPasswordInput: true,
    );


    TextField txtMensajes = TextField (
        controller: txt,
        readOnly: true,
        style: TextStyle(color: Colors.red, fontSize: 18),
        );

    return Scaffold(
      appBar: AppBar( //Muestra la barra superior
        title: Text("Ventana registro"),
      ),
      //backgroundColor: Colors.white38,
      body: Center( //Alinea el texto al centro
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            inputUser,
            inputPass,
            inputPassRep,

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, //Los coloca a distancia
              children: [
                OutlinedButton(
                    onPressed: () {
                      //El if comprueba si las dos contraseñas son iguales
                      //Se hace aqui puesto es que solo nos interesa a nosotros, no a firebase
                      if(inputPass.getText()==inputPassRep.getText()) {
                        registerPressed(
                            inputUser.getText(), inputPass.getText(), context);
                        print("------------>>>>>>Aceptar");
                      }
                      else {
                        txt.text="ERROR CONTRASEÑAS NO COINCIDEN";
                      }
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

            txtMensajes,
          ],
        ),
      ),
    );
  }
}
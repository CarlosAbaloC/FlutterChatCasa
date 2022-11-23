
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_casa/src/custom_views/RFInputText.dart';

/*Para que funcione el Stateful debes crear una clase y la misma en privada
* que extienda de la primera, se inicializa la segunda clase en la primera
* el statefull servia para poder cambiar los objetos de la ventana en tiempo real */
class LoginPhoneView extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
      return _LoginPhoneViewState();
    }
}



class _LoginPhoneViewState extends State<LoginPhoneView> {

  RFInputText inputTextPhone = RFInputText(sTitulo: "Numero de telefono",);
  RFInputText inputTextCode = RFInputText(sTitulo: "Codigo de verificacion",);
  bool blsIsWaitingForSMS = false;
  late String verificationId;


  void enviarTelefono(String phoneNumber, BuildContext) async {
    //Esta funcion estara pendiente de hacer tambien el segundo envio
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,

      //Envia un SMS y lo escribe directamente
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);
        Navigator.of(context).popAndPushNamed('/home');
      },
      //En caso de error en el envio saldra este mensaje
      verificationFailed: (FirebaseAuthException e) {

      },
      //Dice que se manda un codigo y lo esta esperando a que se verifique
      codeSent: (String verificationId, int? resendToken) {
        this.verificationId = verificationId;
        //Con esto te informa del cambio en los datos internos y con esto la pantalla se refresca
        setState(() {
          blsIsWaitingForSMS=true;
        });
      },
      //Cuando falla el tiempo de espera
      codeAutoRetrievalTimeout: (String verificationId) {

      },
    );

  }

  //BuildContext context es para hacer los cambios de pantalla
  void enviarCodigo(String smsCode, BuildContext context) async{
    // Create a PhoneAuthCredential with the code
    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);

    // Sign the user in (or link) with the credential
    await FirebaseAuth.instance.signInWithCredential(credential);
    print("Me he logeado");
    Navigator.of(context).popAndPushNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar( //Muestra la barra superior
        title: Text("Ventana login phone"),
      ),
      //backgroundColor: Colors.white38,
      body: Center( //Alinea el texto al centro
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            inputTextPhone,
            OutlinedButton(
                //onPressed: enviarTelefono, //Ambas formas son validas
                onPressed: () {
                  enviarTelefono(inputTextPhone.getText(),context);
                },
                child: Text("Enviar")
            ),

            if(blsIsWaitingForSMS)inputTextCode,
            if(blsIsWaitingForSMS)OutlinedButton(
                onPressed: () {
                  enviarCodigo(inputTextCode.getText(), context);
                },
                child: Text("Enviar")
            ),
          ],
        ),
      ),
    );
  }

}

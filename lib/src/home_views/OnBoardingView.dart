
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../custom_views/RFInputText.dart';
import '../fb_objects/Perfil.dart';
import '../singleton/DataHolder.dart';



class OnBoardingView extends StatefulWidget {

  const OnBoardingView({Key? key}) : super(key:key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _OnBoardingViewState();
  }
}


class _OnBoardingViewState extends State<OnBoardingView> {


  //Para introducir el texto necesitas un controler
  var txt = TextEditingController();
  FirebaseFirestore db = FirebaseFirestore.instance;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DataHolder().sMensaje = "Hola desde ONBOARDING"; //Sobreescribe el texto del internal

    checkExistingProfile();
  }

  void checkExistingProfile() async{
    String? idUser = FirebaseAuth.instance.currentUser?.uid;
    //Solo apunta al sitio para ver si existe, no se descarga los datos
    final docRef = db.collection("perfiles").doc(idUser);

    DocumentSnapshot docSnap = await docRef.get();
    if(docSnap.exists) {
      Navigator.of(context).popAndPushNamed("/Home"); //CUANDO CAMBIA DE PANTALLA SOLO SE GUARDA LA INFORMACION DADA AL DATAHOLDER
    }
  }

  //Hacerlo async es para que espere a la funcion acabe
  void acceptPressed(String Nombre, String Pais, String Ciudad, int Edad, BuildContext context) async{
    //El primer nombre para saber el lugar donde se inserta (en perfil) y el segundo para el dato
    Perfil perfil = Perfil(name: Nombre, country: Pais, city: Ciudad, edad: Edad);

    await db.collection("perfiles").doc(FirebaseAuth.instance.currentUser?.uid).set(perfil.toFirestore()).onError((e, _) => print("Error writing document: $e"));

    Navigator.of(context).popAndPushNamed("/Home");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();

    RFInputText inputNombre = RFInputText(
        iLongitudPalabra: 20, //Se puede o no definir, si no, usa el valor por defecto
        sHelperText: "Inserte su nombre",
        sTitulo: "Nombre",
        icIzquierda: Icon(Icons.account_circle_outlined)
    );

    RFInputText inputPais = RFInputText(
        iLongitudPalabra: 20, //Se puede o no definir, si no, usa el valor por defecto
        sHelperText: "Inserte su pais",
        sTitulo: "Pais",
        icIzquierda: Icon(Icons.account_circle_outlined)
    );

    RFInputText inputCiudad = RFInputText(
      iLongitudPalabra: 20, //Se puede o no definir, si no, usa el valor por defecto
      sHelperText: "Inserte su ciudad",
      sTitulo: "Ciudad",
    );

    RFInputText inputEdad = RFInputText(
      iLongitudPalabra: 20, //Se puede o no definir, si no, usa el valor por defecto
      sHelperText: "Repita su edad",
      sTitulo: "Edad",
    );


    TextField txtMensajes = TextField (
      controller: txt,
      readOnly: true,
      style: TextStyle(color: Colors.red, fontSize: 18),
    );

    return Scaffold(
      appBar: AppBar( //Muestra la barra superior
        title: Text("Ventana On Boarding"),
      ),
      //backgroundColor: Colors.white38,
      body: Center( //Alinea el texto al centro
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            inputNombre,
            inputPais,
            inputCiudad,
            inputEdad,

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, //Los coloca a distancia
              children: [
                OutlinedButton(
                    onPressed: () {
                        acceptPressed(inputNombre.getText(), inputPais.getText(),
                            inputCiudad.getText(), int.parse(inputEdad.getText()), context);
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
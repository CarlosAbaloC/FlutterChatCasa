
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../fb_objects/Perfil.dart';

class HomeView extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _HomeViewState();
  }
}



class _HomeViewState extends State<HomeView> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  String sNombre = "---";
  bool blIsButtonVisible = true;



  //Este metodo busca la ip del usuario y con ella extrae sus datos
  // como nombre ciudad pais y perfil
  actualizarNombre() async {
    //Esto busca un id en concreto, no es dinamico
    //final docRef = db.collection("perfiles").doc("bn6QpIScxrTqA35QR58QYAvtFWA3");

    //Busca el id dinamicamente
    String? idUser = FirebaseAuth.instance.currentUser?.uid;
    final docRef = db.collection("perfiles").
    doc(idUser).withConverter(fromFirestore: Perfil.fromFirestore,
        toFirestore: (Perfil perfil, _) => perfil.toFirestore());

    //get para descargar then es lo que tiene que hacer despues
    /*docRef.get().then(
          (DocumentSnapshot doc) {
            if(doc.exists) {
              Perfil perfil = perfil.

              final data = doc.data() as Map<String, dynamic>;
              print("--------------->>>>>>>>> " + data.toString() + "   " + doc.get("name") + " " + data["name"]);
            }

            //PARA ACTUALIAR LAS VARIABLES
            setState(() {
              blIsButtonVisible=false;
              sNombre = doc.get("name");
            });
      },

      onError: (e) => print("Error getting document: $e"),
    );
    */
    final docSnap = await docRef.get();
    final perfilUsuario = docSnap.data(); // Convert to City object

    if (perfilUsuario != null) {
      print(perfilUsuario.edad);
      setState(() {
        sNombre=perfilUsuario.name!;
      });
    } else {
      print("No such document.");
    }


  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   
    return Scaffold(
      appBar: AppBar( //Muestra la barra superior
        title: Text("Chatdar"),
      ),
      //backgroundColor: Colors.white38,
      body: Center( //Alinea el texto al centro
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Bienvenido: " + sNombre),
            if(blIsButtonVisible)OutlinedButton(
                onPressed: () {
                  actualizarNombre();
                },
                child: Text("Refress")
            ),
            if(blIsButtonVisible)OutlinedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context).popAndPushNamed("/Login");
                },
                child: Text("Logout")
            ),
          ],
        ),
      ),
    );
  }

}

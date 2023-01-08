
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_casa/src/singleton/DataHolder.dart';

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

  @override
  void initState() {
    super.initState();


  }



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
    //final perfilUsuario = docSnap.data(); // Convert to City object
    DataHolder().perfil=docSnap.data()!; //Guarda la informacion en un lugar a parte, no se borrara


    if (DataHolder().perfil!= null) {
      print(DataHolder().perfil.edad);
      setState(() {
        sNombre=DataHolder().perfil.name!;
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
        title: Text("Rooms"),
      ),
      //backgroundColor: Colors.white38,
      body: Center( //Alinea el texto al centro
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget> [
            Container(
              height: 50,
              color: Colors.amber[600], //El numero es lo oscuro del color amber
              child: const Center(child: Text('Entry A')),
            ),
            Container(
              height: 50,
              color: Colors.amber[500],
              child: const Center(child: Text('Entry B')),
            ),
            Container(
              height: 50,
              color: Colors.amber[100],
              child: const Center(child: Text('Entry C')),
            ),
          ],
        ),
      ),
    );
  }

}

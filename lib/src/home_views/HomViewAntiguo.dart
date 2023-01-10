
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../fb_objects/Perfil.dart';
import '../fb_objects/Room.dart';
import '../list_items/RoomItem.dart';
import '../singleton/DataHolder.dart';

class HomeViewAntiguo extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _HomeViewAntiguoState();
  }
}



class _HomeViewAntiguoState extends State<HomeViewAntiguo> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  String sNombre = "---";
  bool blIsButtonVisible = true;
  late List<QueryDocumentSnapshot<Room>> chatRooms = const[]; //Query para poder trabajar directamente la lista de rooms

  @override
  void initState() {
    super.initState();
    actualizarLista();
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

  void actualizarLista() async {
    final docRef = db.collection("rooms") //Para descargarse todos los archivos de rooms, por eso no usa ids ni nada
        .withConverter(fromFirestore: Room.fromFirestore,
        toFirestore: (Room room, _) => room.toFirestore());

    final docSnap = await docRef.get(); //Pasa todo lo descargado a una lista, docsnap

    setState(() {
      chatRooms = docSnap.docs;
    });

  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //Con esto añade celdas en funcion de estas filas
    final List<String> entries = <String>['A','B','C','D','E'];
    final List<int> colorCodes = <int>[600, 500,100,400,300];

    return Scaffold(
      appBar: AppBar( //Muestra la barra superior
        title: Text("Rooms"),
      ),
      //backgroundColor: Colors.white38,
      body: Center( //Alinea el texto al centro
        //child: ListView.builder(
        child: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length, //Para los valores de arriba
          itemBuilder: (BuildContext context, int index) { //El indice de arriba, asi te dice que pintar en cada posicion
            return RoomItem(sTitulo: entries[index],
               index: index, onShortClick: (int index) {  }, //Valores inutiles para esta capa
            ); //Modifica el valor dado por defecto
          },
          separatorBuilder: (BuildContext context, int index) { //Solo con separated
            return const Divider(); //Pone una linea divisiora encre cada uno
            //return RFInputText(sTitulo: "Divisor del: " + entries[index],); //Devuelve una linea de imput text
            //Se puede dividir con cualquier objeto, hasta fotos
          },
        ),

        /* De manera fija
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget> [
            Container(
              height: 50,
              color: Colors.amber[600], //El numero es lo oscuro del color amber
              child: const Center(child: Text('Entry A')),
            ),
          ],
        ),
      */
      ),
    );
  }

}
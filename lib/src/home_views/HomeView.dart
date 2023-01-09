
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_casa/src/custom_views/RFInputText.dart';
import 'package:flutter_chat_casa/src/singleton/DataHolder.dart';

import '../fb_objects/Perfil.dart';
import '../fb_objects/Room.dart';
import '../list_items/RoomItem.dart';

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
  //late List<QueryDocumentSnapshot<Room>> chatRooms = const[]; //Query para poder trabajar directamente la lista de rooms
  late List<Room> chatRooms = [];

  @override
  void initState() {
    super.initState();
    actualizarLista();
  }



  //Este metodo busca la ip del usuario y con ella extrae sus datos
  // como nombre ciudad pais y perfil
  actualizarNombre() async {

    //Busca el id dinamicamente
    String? idUser = FirebaseAuth.instance.currentUser?.uid;
    final docRef = db.collection("perfiles").
    doc(idUser).withConverter(fromFirestore: Perfil.fromFirestore,
        toFirestore: (Perfil perfil, _) => perfil.toFirestore());

    final docSnap = await docRef.get();
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

    late List<Room> chatRoomsTemporal = [];



    setState(() {
      for(int i=0; i<docSnap.docs.length; i++) {
        chatRooms.add(docSnap.docs[i].data());
      } //SIN QUERY
      //chatRooms = docSnap.docs; //METODO PARA EL QUERY
    });

  }

  void listItemShortClicked(int index) {
    print("DEBUG: " + index.toString());
    print("DEBUG: " +chatRooms[index].name!); //El index comprueba en que posicion esta
    DataHolder().selectedChatRoom=chatRooms[index];
    Navigator.of(context).pushNamed("/ChatView");
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build


   
    return Scaffold(
      appBar: AppBar( //Muestra la barra superior
        title: Text("Rooms"),
      ),
      body: Center( //Alinea el texto al centro
        child: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: chatRooms.length, //Valores sacados de Firebase
            itemBuilder: (BuildContext context, int index) { //El indice de arriba, asi te dice que pintar en cada posicion
              return RoomItem(
                sTitulo: chatRooms[index].name!,
                onShortClick: listItemShortClicked,
                index: index,//Llama a la funcion de clicar
              ); //Conexta a Room
              // return RoomItem(sTitulo: chatRooms[index].data().name!,); //QUERY Coge el dato del nombre de los chats
            },
          separatorBuilder: (BuildContext context, int index) { //Solo con separated
              return const Divider(); //Pone una linea divisiora encre cada uno

          },
        ),
      ),
    );
  }

}

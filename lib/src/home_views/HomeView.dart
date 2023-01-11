
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eurekalib/grid_views/RoomCard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_casa/src/custom_views/RFInputText.dart';
import 'package:flutter_chat_casa/src/singleton/DataHolder.dart';

import '../fb_objects/Perfil.dart';
import '../fb_objects/Room.dart';
import '../list_items/RoomItem.dart';
import 'package:http/http.dart' as http;

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

  void getPilotosF1() async{



    final response = await http
        .get(Uri.parse('http://ergast.com/api/f1/2022/drivers.json?callback=myParser'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print("DEBUG: --->>>>>>>>>   "+response.body);
      //return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  void getRoomsList() async{
    //String Query=SELECT * FROM ROOMS WHERE MEMBERS >25 && MEMBERS <100
    //final docsRef = db.collection("rooms").where("members",isGreaterThan: 25,isLessThan: 100).
    final docsRef = db.collection("rooms").where("members",isGreaterThan: 25,isLessThan: 170).
    orderBy("members",descending: false).
    withConverter(fromFirestore: Room.fromFirestore,
        toFirestore: (Room room, _) => room.toFirestore());

    //stmt.executeQuery(Query);
    final docsSnap = await docsRef.get();

    setState(() {
      for(int i=0;i<docsSnap.docs.length;i++){
        chatRooms.add(docsSnap.docs[i].data());
      }
    });

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
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: chatRooms.length,
            itemBuilder: (BuildContext context, int index) {
              return RoomCard(sImgURL: chatRooms[index].image!,
                sName: chatRooms[index].name!,onShortClick: listItemShortClicked,
                index: index,);
            }
        )
      ),
    );
  }

}

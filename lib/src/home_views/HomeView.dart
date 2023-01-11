
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eurekalib/grid_views/RoomCard.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../fb_objects/Perfil.dart';
import '../fb_objects/Room.dart';
import '../singleton/DataHolder.dart';
import 'package:http/http.dart' as http;

class HomeView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return _HomeViewState();
  }
}

class _HomeViewState extends State<HomeView>{

  FirebaseFirestore db = FirebaseFirestore.instance;
  String sNombre="AQUI IRA EL NOMBRE";
  List<Room> chatRooms= [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRoomsList();
    getPilotosF1();
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

  void listItemShortClicked(int index){
    print("DEBUG: "+index.toString());
    print("DEBUG: "+chatRooms[index].name!);
    //DataHolder().selectedChatRoom=chatRooms[index];
    Navigator.of(context).pushNamed("/ChatView");
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text('Chatdar'),
      ),
      //backgroundColor: Colors.orangeAccent,
      body: Center(
          child:
          GridView.builder( //Funciona igual que el ListView
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
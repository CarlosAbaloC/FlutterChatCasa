

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_casa/src/custom_views/RFInputText.dart';
import 'package:flutter_chat_casa/src/list_items/ChatItem.dart';
import 'package:flutter_chat_casa/src/singleton/DataHolder.dart';

import '../fb_objects/FBText.dart';

class ChatView extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _ChatViewState();
  }
}


class _ChatViewState extends State<ChatView> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  late List<FBText> chatText = [];
  RFInputText inputMsg = RFInputText(iLongitudPalabra: 200,);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    descargarTextos();
    //print("DEBUG: " + DataHolder().selectedChatRoom.name!);
  }

  void descargarTextos() async {
    String path = DataHolder().sCollection_Rooms_Name+"/"+
        DataHolder().selectedChatRoom.uid+"/"+
        DataHolder().sCollection_Texts_Name; //Coge la id desde room y la pone, asi se cambia si es una u otra

    final docRef = db.collection(path). //Para descargarse todos los archivos de rooms, por eso no usa ids ni nada
        withConverter(fromFirestore: FBText.fromFirestore,
        toFirestore: (FBText fbtext, _) => fbtext.toFirestore());

    docRef.snapshots().listen(
          (event) => {
            setState(() {
              chatText.clear(); //Para que no de dupliquen los textos
              for(int i=0; i<event.docs.length; i++) {
                chatText.add(event.docs[i].data());
              }
            })
          },
          onError: (error) => print("Listen failed: $error"),
    );

    /*

    final docSnap = await docRef.get(); //Pasa todo lo descargado a una lista, docsnap

    setState(() {
      for(int i=0; i<docSnap.docs.length; i++) {
        chatText.add(docSnap.docs[i].data());
      }
    });
     */
  }

  void listItemShortClicked(int index) {

  }

  //Pasos: Busca la room donde esta, crea la coleccion, busca el usuario que escribe, y luego escribe un texto con los tres parametros de la base de datos
  Future<void> sendPressed() async {
    String path = DataHolder().sCollection_Rooms_Name+"/"+
        DataHolder().selectedChatRoom.uid+"/"+
        DataHolder().sCollection_Texts_Name;


    final docRef = db.collection(path);
    FBText texto = FBText(
        text: inputMsg.getText(),
        author: DataHolder().perfil.uid,
        time: Timestamp.now()
    );

    await docRef.add(texto.toFirestore());

    //descargarTextos(); //No hace falta, lo hace automatico desde la database
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar( //Muestra la barra superior
        title: Text("Rooms"),
      ),
      body: Center( //Alinea el texto al centro
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              color: Colors.amber,
              height: 400.0,
              child: ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: chatText.length, //Valores sacados de Firebase
                  itemBuilder: (BuildContext context, int index) { //El indice de arriba, asi te dice que pintar en cada posicion
                    return ChatItem(
                      sText: chatText[index].text!,
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
            inputMsg,
            OutlinedButton(
                onPressed: sendPressed,
                child: Text("Send"),
            )
          ],
        )
      ),
    );
  }



}
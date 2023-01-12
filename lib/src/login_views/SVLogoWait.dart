

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_casa/src/singleton/DataHolder.dart';

class SVLogoWait extends StatefulWidget {

  final String sLogoPath;
  SVLogoWait(this.sLogoPath, {super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _SVLogoWaitState(); 
  }

}

class _SVLogoWaitState extends State<SVLogoWait> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //FirebaseAuth.instance.signOut();
    loadAllData();
  }

  void loadAllData() async{
    await Future.delayed(Duration(seconds: 2)); //Para que de tiempo a cargar, solo hace la espera

    if(FirebaseAuth.instance.currentUser==null) {
      setState(() {
        Navigator.of(context).popAndPushNamed("/LoginView");
      });
    }
    else {
      bool existe = await checkExistingProfile();
      if(existe) {
        setState(() {
          Navigator.of(context).popAndPushNamed("/Home");
        });
      }
      else {
        setState(() {
          Navigator.of(context).popAndPushNamed("/OnBoarding");
        });
      }
    }
  }

  Future<bool> checkExistingProfile() async{
    String? idUser = FirebaseAuth.instance.currentUser?.uid;
    //Solo apunta al sitio para ver si existe, no se descarga los datos
    final docRef = db.collection("perfiles").doc(idUser);

    DocumentSnapshot docSnap = await docRef.get();
    return docSnap.exists;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    DataHolder().platformAdmin.initDisplayData(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(widget.sLogoPath), height: DataHolder().platformAdmin.dScreen_Width/2,),
            Text("Cargando ...", style: TextStyle(fontSize: DataHolder().platformAdmin.dScreen_Height/10),),
            SizedBox(height: DataHolder().platformAdmin.dScreen_Height/20), //Creas la caja solo para separarlo
            const CircularProgressIndicator(
            semanticsLabel: 'Indicador de progreso',
            )
          ],
        ),
      ),
    );
  }

}


import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_casa/src/platform/PlatformAdmin.dart';

import '../fb_objects/Perfil.dart';
import '../fb_objects/Room.dart';

//Es una clase comun para guardar todos los datos
class DataHolder {
  static final DataHolder _dataHolder = new DataHolder._internal(); //Internal funciona como constructor
  String sCollection_Rooms_Name = "rooms"; //Nombres de las colecciones
  String sCollection_Texts_Name = "Texts";

  String sMensaje = " ";
  Perfil perfil =Perfil();
  Room selectedChatRoom = Room();
  late PlatformAdmin platformAdmin;

  DataHolder._internal() {
    sMensaje ="Mensaje cambiado en DataHolder._internal";
    platformAdmin = PlatformAdmin();
  }

  /*
  void initPlatformAdminDisplaySetting(BuildContext context) {
    platformAdmin.initDisplayData(context);
  }
   */

  factory DataHolder() {
    return _dataHolder; //Data holder simpre devolvera la variable de arriba
  }

}
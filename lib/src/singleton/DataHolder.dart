

import '../fb_objects/Perfil.dart';
import '../fb_objects/Room.dart';

//Es una clase comun para guardar todos los datos
class DataHolder {
  static final DataHolder _dataHolder = new DataHolder._internal(); //Internal funciona como constructor

  String sMensaje = " ";
  Perfil perfil =Perfil();
  Room selectedChatRoom = Room();

  DataHolder._internal() {
    sMensaje ="Mensaje cambiado en DataHolder._internal";

  }

  factory DataHolder() {
    return _dataHolder; //Data holder simpre devolvera la variable de arriba
  }

}
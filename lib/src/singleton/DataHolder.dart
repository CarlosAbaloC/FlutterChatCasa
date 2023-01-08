

import '../fb_objects/Perfil.dart';

//Es una clase comun para guardar todos los datos
class DataHolder {
  static final DataHolder _dataHolder = new DataHolder._internal(); //Internal funciona como constructor

  String sMensaje = " ";
  Perfil perfil =Perfil();

  DataHolder._internal() {
    sMensaje ="Mensaje cambiado en internal";

  }

  factory DataHolder() {
    return _dataHolder; //Data holder simpre devolvera la variable de arriba
  }

}
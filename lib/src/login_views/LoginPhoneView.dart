
import 'package:flutter/cupertino.dart';

/*Para que funcione el Stateful debes crear una clase y la misma en privada
* que extienda de la primera, se inicializa la segunda clase en la primera
* el statefull servia para poder cambiar los objetos de la ventana en tiempo real */
class LoginPhoneView extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
      return _LoginPhoneViewState();
    }

  }


}



class _LoginPhoneViewState extends State<LoginPhoneView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}

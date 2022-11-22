
import 'package:flutter/material.dart';

class RFInputText extends StatelessWidget{

  final String sValorInicial;
  final int iLongitudPalabra;
  final String sHelperText;
  final String sTitulo;
  final Icon icIzquierda;
  final Icon icDerecha;
  final bool blIsPasswordInput;

  RFInputText({Key? key,
    this.sValorInicial ="",
    this.iLongitudPalabra =8,
    this.sHelperText="",
    this.sTitulo ="",
    this.icIzquierda=const Icon(Icons.favorite),
    this.icDerecha=const Icon(Icons.check_circle),
    this.blIsPasswordInput = false,
  }) : super(key:key);

  //El controller y el const no pueden funcionar por lo que se quita del RFInputText
  final TextEditingController _controller=TextEditingController();


  String getText() {
    return _controller.text;
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      controller: _controller,
      cursorColor: Colors.pink,
      //initialValue: this.sValorInicial, //no puedes poner controller y initialvalue a la vez
      maxLength: iLongitudPalabra, //El tamaño maximo del usuario
      //El bl ahora esta en false, por lo que permite ver las palabras y el autocorrector
      //En cambio cuando sea una contraseña cambian las tornas true como false false como true
      obscureText: blIsPasswordInput, //No permite ver las palabras
      enableSuggestions: !blIsPasswordInput, //Evita las sugerencias
      autocorrect: !blIsPasswordInput, //Quita el autocorrector
      decoration: InputDecoration(
        icon: icIzquierda,
        labelText: sTitulo,
        labelStyle: TextStyle(
          color: Color(0xFF6200EE),
        ),
        helperText: sHelperText,
        suffixIcon: icDerecha,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF6200EE))
        ),
      ),
    );
  }

}
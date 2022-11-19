
import 'package:flutter/material.dart';

class RFInputText extends StatelessWidget{

  final String sValorInicial;
  final int iLongitudPalabra;
  final String sHelperText;
  final String sTitulo;
  final Icon icIzquierda;
  final Icon icDerecha;
  const RFInputText({Key? key,
    this.sValorInicial ="",
    this.iLongitudPalabra =8,
    this.sHelperText="",
    this.sTitulo ="",
    this.icIzquierda=const Icon(Icons.favorite),
    this.icDerecha=const Icon(Icons.check_circle),
  }) : super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      cursorColor: Colors.pink,
      initialValue: this.sValorInicial,
      maxLength: iLongitudPalabra, //El tamaño maximo del usuario
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
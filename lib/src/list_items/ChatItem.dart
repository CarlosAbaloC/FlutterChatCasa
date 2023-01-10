

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {

  final String sText;
  final Function(int index) onShortClick; //Funcion para llamarle
  final int index;

  const ChatItem({Key? key,
    this.sText="Mensaje",
    required this.onShortClick,
    required this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
                height: 20, //Espacio entre textos
                child: Center(child: Text(sText)),
    );


  }

}
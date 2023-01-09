

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomItem extends StatelessWidget {

  final String sTitulo;
  final Function(int index) onShortClick; //Funcion para llamarle
  final int index;

  const RoomItem({Key? key,
    this.sTitulo="Titulo",
    required this.onShortClick,
    required this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      title: Text(sTitulo),
      subtitle: Text('Secondary text'),
      leading: Icon(Icons.label),
      onTap: () {
        onShortClick(index);
      },
    );
    /* Otra Forma de hacer una lista
         return Container(
                height: 50,
                color: Colors.amber[colorCodes[index]],
                child: Center(child: Text('Entry ${entries[index]}')),
              );
      */

  }

}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NameBox extends StatelessWidget{

  final String name;
  const NameBox({Key? key, required this.name}) : super(key:key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();

    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.greenAccent),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(name),
      ),
    );
  }

}
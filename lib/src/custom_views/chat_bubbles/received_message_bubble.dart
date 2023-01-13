

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Chat_Trail.dart';

class ReceiveMessageBubble extends StatelessWidget {

  final String sMessage;

  const ReceiveMessageBubble({Key? key, required this.sMessage}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    final messageTextGroup = Flexible(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(pi),
              child: CustomPaint(
                painter: ChatTrail(Colors.grey[300]!),
              ),
            ),
            Flexible(
              child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(18),
                      bottomLeft: Radius.circular(18),
                      bottomRight: Radius.circular(18),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        sMessage,
                        style: const TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ],
                  )
              ),
            ),
          ],
        ));

    return Padding(
      padding: EdgeInsets.only(right: 50,left: 18.0,top: 15, bottom: 5), //Es el maximo tamaño hasta el salto de linea
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          const SizedBox(height: 30),
          messageTextGroup //Puedo ponerlo asi o ponerlo dentro del propio TextGroup
        ],
      ),
    );
  }


}
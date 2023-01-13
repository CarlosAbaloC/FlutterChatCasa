
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_casa/src/custom_views/chat_bubbles/Chat_Trail.dart';

class SendMessageBubble extends StatelessWidget {

  final String sMessage;

  const SendMessageBubble({Key? key, required this.sMessage}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    final messageTextGroup = Flexible(//Permite saltos de linea que el tamaño sea grande, pequeño ...
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Container(
                padding: EdgeInsets.all(14), //Alrrededor
                decoration: BoxDecoration( //El decorado del contenedor
                  color: Colors.cyan[900], //Enviados
                  borderRadius: BorderRadius.only( //El radio y sus tres esquinas
                    topLeft: Radius.circular(18),
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18),
                  ),
                ),
                child: Text(
                  sMessage,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ),
            CustomPaint(painter: ChatTrail(Colors.cyan[900]!)),
          ],
        ));

    return Padding(
      padding: EdgeInsets.only(right: 18.0,left: 50,top: 15, bottom: 5), //Es el maximo tamaño hasta el salto de linea
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
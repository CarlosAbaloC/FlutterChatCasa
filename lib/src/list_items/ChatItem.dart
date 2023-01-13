

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_casa/src/custom_views/chat_bubbles/received_message_bubble.dart';
import 'package:flutter_chat_casa/src/custom_views/chat_bubbles/send_message_bubble.dart';

import '../custom_views/chat_bubbles/received_message_bubble.dart';

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
    /*
    return Container(
                height: 20, //Espacio entre textos
                child: Center(child: Text(sText)),
    );
     */

    return ReceiveMessageBubble(sMessage: sText);
  }

}
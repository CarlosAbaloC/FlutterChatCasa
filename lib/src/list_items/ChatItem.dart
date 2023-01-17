

import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_casa/src/custom_views/chat_bubbles/received_message_bubble.dart';
import 'package:flutter_chat_casa/src/custom_views/chat_bubbles/send_message_bubble.dart';

import '../custom_views/chat_bubbles/received_message_bubble.dart';

class ChatItem extends StatelessWidget {

  final String sText;
  final Function(int index) onShortClick; //Funcion para llamarle
  final int index;
  final String sAuthor;

  const ChatItem({Key? key,
    this.sText="Mensaje",
    required this.onShortClick,
    required this.index,
    required this.sAuthor
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


    if(sAuthor==FirebaseAuth.instance.currentUser?.uid) {
      return BubbleSpecialThree(
        text:sText,
        color: Color(0xFF1B97F3),
        tail: true,
        textStyle: TextStyle(
            color: Colors.white,
            fontSize: 16
        ),
      );
      //return SendMessageBubble(sMessage: sText);
    }
    else {
      //return ReceiveMessageBubble(sMessage: sText);
      return BubbleSpecialThree(
        text: sText,
        color: Color(0xFFE8E8EE),
        tail: true,
        isSender: false,
      );

    }

  }

}
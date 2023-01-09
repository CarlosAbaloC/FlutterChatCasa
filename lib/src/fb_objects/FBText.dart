
import 'package:cloud_firestore/cloud_firestore.dart';

class FBText {
  final String? text;
  final String? author;
  final Timestamp? time;

  FBText({
    this.text ="",
    this.author ="",
    this.time,
  });

  factory FBText.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return FBText(
      text: data?['text'],
      author: data?['author'],
      time: data?['time'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      //Estos nombres deben ser iguales a los del firebase
      if (text != null) "text": text,
      if (author != null) "author": author,
      if (time != null) "time": time,
    };
  }
}
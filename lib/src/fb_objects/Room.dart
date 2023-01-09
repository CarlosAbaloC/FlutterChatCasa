

import 'package:cloud_firestore/cloud_firestore.dart';

class Room {
  final String uid; //ID Sala
  final String? name;

  Room({
    this.name ="",
    this.uid="",
  });

  factory Room.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Room(
      name: data?['name'],
      uid: snapshot.id,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      //Estos nombres deben ser iguales a los del firebase
      if (name != null) "name": name,
    };
  }
}
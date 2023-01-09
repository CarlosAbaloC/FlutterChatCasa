

import 'package:cloud_firestore/cloud_firestore.dart';

class Room {
  final String? name;

  Room({
    this.name ="",
  });

  factory Room.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Room(
      name: data?['name'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      //Estos nombres deben ser iguales a los del firebase
      if (name != null) "name": name,
    };
  }
}
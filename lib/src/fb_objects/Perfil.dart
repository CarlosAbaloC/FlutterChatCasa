import 'package:cloud_firestore/cloud_firestore.dart';

class Perfil {
  final String? name;
  final String? city;
  final String? country;
  final int? edad;


  Perfil({
    this.name ="",
    this.city ="",
    this.country ="",
    this.edad =0,
  });

  factory Perfil.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Perfil(
      name: data?['name'],
      city: data?['city'],
      country: data?['country'],
      edad: data?['edad'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      //Estos nombres deben ser iguales a los del firebase
      if (name != null) "name": name,
      if (city != null) "city": city,
      if (country != null) "country": country,
      if (edad != 0) "edad": edad,
    };
  }
}
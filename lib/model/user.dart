import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String? firstName;
  final String? lastName;
  final String? number;
  final String? email;
  final String? password;
  final Timestamp? timestamp;
  User( 
      {required this.firstName,
      required this.timestamp,
      required this.lastName,
      required this.number,
      required this.email,
      required this.password});
}

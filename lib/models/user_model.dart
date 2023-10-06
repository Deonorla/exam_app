import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String fullName;
  final String matricNo;
  final String email;
  final String phoneNo;
  final String password;

  const UserModel(
      {this.id,
      required this.fullName,
      required this.matricNo,
      required this.email,
      required this.phoneNo,
      required this.password});

  toJson() {
    return {
      "FullName": fullName,
      "MatricNo": matricNo,
      "Email": email,
      "Phone": phoneNo,
      "Password": password,
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document ){
    final data = document.data()!;
    return UserModel(
      id: document.id,
        fullName: data['FullName'],
        matricNo: data['MatricNo'],
        email: data['Email'],
        phoneNo: data['Phone'],
        password: data['Password'],
    );
  }
}

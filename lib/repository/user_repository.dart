import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cbt_mobile_application/models/user_model.dart';
import 'package:cbt_mobile_application/screens/home/home_screen.dart';
import 'package:cbt_mobile_application/widgets/toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  //create user
  createUser(UserModel user) async {
    await _db
        .collection("Users")
        .add(user.toJson())
        .whenComplete(
          () => Toast.show(Get.context, "Your deatils has been created",
              "Success", ContentType.success),
        )
        .catchError((error, StackTrace) {
      Toast.show(Get.context, "Something went wrong, Try again.", "Oops",
          ContentType.failure);
      print(error.toString());
    });
  }

//  fetch user details
 Future<UserModel> getUserDetails(String email) async {
    final snapshot = await _db.collection("Users").where("Email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
 }

}

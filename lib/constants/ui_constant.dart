import 'package:cbt_mobile_application/controllers/profileController.dart';
import 'package:cbt_mobile_application/models/user_model.dart';
import 'package:cbt_mobile_application/screens/profile/widget/user_profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'colors.dart';

class UiConstant {
  static AppBar appBar() {
    final controller = Get.put(ProfileController());
    String userName = '';
    return AppBar(
      backgroundColor: primaryColor,
      elevation: 0,
      centerTitle: false,
      title: FutureBuilder(
        future: controller.getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              UserModel userData = snapshot.data as UserModel;
              userName = userData.fullName;
              return RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(children: [
                    const TextSpan(
                        text: "Welcome \n",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w500)),
                    TextSpan(
                        text: userData.fullName,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 43, 42, 42),
                          fontSize: 15,
                        ))
                  ]));
            } else {
              return const Text("");
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      leading:FutureBuilder<UserModel>(
        future: controller.getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              UserModel userData = snapshot.data!;
              String userName = userData.fullName; // Set userName here
              return Container(
                margin: const EdgeInsets.only(left: 10),
                child: UserProfilePicture(
                  name: userName, // Pass userName as a parameter
                ),
              );
            } else {
              return Container(); // Return an empty container if no data is available
            }
          } else {
            return Container(); // Return an empty container while data is being loaded
          }
        },
      ),
    );
  }
}

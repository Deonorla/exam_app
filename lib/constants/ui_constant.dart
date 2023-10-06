import 'package:cbt_mobile_application/controllers/profileController.dart';
import 'package:cbt_mobile_application/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'colors.dart';

class UiConstant {
  static AppBar appBar() {
  final controller = Get.put(ProfileController());
    return AppBar(
      backgroundColor: primaryColor,
      elevation: 0,
      centerTitle: false,
      title: FutureBuilder(
        future: controller.getUserData(),
        builder: (context, snapshot){
           if(snapshot.connectionState == ConnectionState.done){
              if(snapshot.hasData){
                UserModel userData = snapshot.data as UserModel;
                return RichText(
                    textAlign: TextAlign.start,
                    text:  TextSpan(children: [
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
              }else {
                return const Text("");
              }
           }else{
             return const Center(child: CircularProgressIndicator(),);
           }
        },
      ),
      leading: Container(
        margin: const EdgeInsets.only(left: 10),
        child: CircleAvatar(
          child: Image.asset("assets/images/splash_images/avatar.png"),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            onPressed: () {},
            child: const Icon(
              Icons.notifications_outlined,
              size: 25,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }
}

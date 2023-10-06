import 'package:cbt_mobile_application/constants/colors.dart';
import 'package:cbt_mobile_application/controllers/auth/auth_controller.dart';
import 'package:cbt_mobile_application/controllers/profileController.dart';
import 'package:cbt_mobile_application/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widget/detail_field.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    final profController = Get.put(ProfileController());
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: FutureBuilder(
          future: profController.getUserData(),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.done){
            if(snapshot.hasData){
              UserModel userData = snapshot.data as UserModel;
              return SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Center(
                      child: Text(
                        "My Profile",
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(children: [
                      Image.asset('assets/images/splash_images/avatar2.png'),
                      const SizedBox(
                        height: 20,
                      ),
                       Text(
                       userData!.fullName,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      )
                    ]),
                    const SizedBox(
                      height: 50,
                    ),
                    DetailField(
                      size: size,
                      detail: userData.email,
                      icon: const Icon(
                        CupertinoIcons.person,
                        color: darkColor,
                        size: 28,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    DetailField(
                      size: size,
                      detail: userData.matricNo,
                      icon: const Icon(
                        CupertinoIcons.square_stack_3d_up,
                        color: darkColor,
                        size: 28,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    DetailField(
                      size: size,
                      detail: 'First Semester',
                      icon: const Icon(
                        CupertinoIcons.book,
                        color: darkColor,
                        size: 28,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    DetailField(
                      size: size,
                      detail: 'CGPA - 4.90',
                      icon: const Icon(
                        CupertinoIcons.chart_bar,
                        color: darkColor,
                        size: 28,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    DetailField(
                      size: size,
                      detail: userData.phoneNo,
                      icon: const Icon(
                        CupertinoIcons.house_alt,
                        color: darkColor,
                        size: 28,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton.icon(
                        onPressed: () {
                          controller.logout();
                        },
                        icon: const Icon(
                          CupertinoIcons.power,
                          size: 20,
                          color: darkColor,
                        ),
                        label: const Text(
                          "Log Out",
                          style: TextStyle(
                              fontSize: 18,
                              color: darkColor,
                              fontWeight: FontWeight.w600),
                        ))
                  ],
                ),
              );
            }else if(snapshot.hasError){
             return Center(child: Text(snapshot.error.toString()));
            }else {
              return const Center(child: Text("Something went wrong"),);
            }
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );

            }
          },
        ),
      ),
    );
  }
}

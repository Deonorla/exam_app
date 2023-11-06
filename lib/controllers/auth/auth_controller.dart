
import 'package:cbt_mobile_application/exceptions/signup_email_password_failure.dart';

import 'package:cbt_mobile_application/screens/home/home_screen.dart';
import 'package:cbt_mobile_application/screens/welcome_screen/welcome_screen.dart';
import 'package:cbt_mobile_application/widgets/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class AuthController extends GetxController {
  static AuthController get instance => Get.find();
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  final RxBool isLoading = false.obs;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => WelcomeScreen())
        : Get.offAll(() => const HomeScreen());
  }

  void createUserWithEmailAndPassword(String email, String password) async {
    try {
      isLoading.value = true;
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? {
              Get.offAll(() => const HomeScreen()),
              Toast.show(Get.context, "SignUp Successful", "Welcome",
                  ContentType.success)
            }
          : Get.to(() => WelcomeScreen());
      isLoading.value = false;
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      Toast.show(Get.context, "An error occurred try signing in again", "Ooops",
          ContentType.failure);
      print('FIREBASE AUTH EXCEPTION = ${ex.message}');
      throw ex;
    } catch (e) {
      isLoading.value = false;
      const ex = SignUpWithEmailAndPasswordFailure();
      print(' EXCEPTION = ${ex.message}');
      throw ex;
    }
  }

  void loginWithEmailAndPassword(String email, String password) async {

    try {
      isLoading.value = true;
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => Toast.show(
              Get.context,
              "You are successfully logged In",
              "Welcome Back",
              ContentType.success));
      isLoading.value = false;
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      if (e.code == 'user-not-found') {
        Toast.show(Get.context, "User not found try signing up", "Ooops",
            ContentType.failure);
      } else if (e.code == 'wrong-password') {
        Toast.show(Get.context, "Your password is incorrect", "Ooops",
            ContentType.failure);
        ;
      }
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
      // Navigator.of(context).pop();
  }

  Future<void> logout() async =>
      await _auth.signOut().whenComplete(() => Toast.show(Get.context,
          "Logged out Successfull", "Logged Out", ContentType.success));

  User? getUser() {
    firebaseUser.value = _auth.currentUser;
    return firebaseUser.value;
  }

  // late FirebaseAuth _auth;
  // final _user = Rxn<User>();
  // late Stream<User?> _authStateChanges;

  // void initAuth() async {
  //   _auth = FirebaseAuth.instance;
  //   _authStateChanges = _auth.authStateChanges();
  //   _authStateChanges.listen((User? user) {
  //     _user.value = user;
  //   });
  // }

  // signInWithGoogle() async {
  //   final GoogleSignIn _googleSignIn = GoogleSignIn();
  //   try {
  //     GoogleSignInAccount? account = await _googleSignIn.signIn();
  //     if (account! == null) {
  //       final _authAccount = await account.authentication;
  //       final _credential = GoogleAuthProvider.credential(
  //           idToken: _authAccount.idToken,
  //           accessToken: _authAccount.accessToken);
  //       await _auth.signInWithCredential(_credential);
  //       await saveUser(account);
  //     }
  //   } on Exception catch (error) {
  //     print(error);
  //   }
  // }

  // saveUser(GoogleSignInAccount account) {
  //   userRf.doc(account.email).set({
  //     "email": account.email,
  //     "name": account.displayName,
  //     "profilepic": account.photoUrl
  //   });
  // }
}

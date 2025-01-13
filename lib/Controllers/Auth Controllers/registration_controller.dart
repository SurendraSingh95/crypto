// Dart imports:
import 'dart:developer';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

// Project imports:


class RegistrationController extends GetxController {
  var passwordVisible = false.obs;
  var isLoading = false.obs;

  PhoneNumber number = PhoneNumber(isoCode: 'NG');
  String _fcmToken = '';
  //final _messaging = FirebaseMessaging.instance;
  final formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
   final phoneController = TextEditingController();
  final referralController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

 // String get registerUrl => ApiServices().registerNewUser;

  // Future<void> getFCMToken() async {
  //   _fcmToken = await _messaging.getToken() ?? "";
  //   log('fcm token -->$_fcmToken');
  // }

  ///on controller close
  @override
  void onClose() {
    emailController.dispose();
    userNameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    passwordController.dispose();
    referralController.dispose();
    super.onClose();
  }

  ///handle password visibility
  void togglePasswordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }





  // getRegister(String mobile) async {
  //   isLoading.value = true;
  //   final locationAvailable = await checkPermissionAndGetLocation();
  //   if(!locationAvailable){
  //     Utils.mySnackBar(
  //       title: "Please allow Location permission",);
  //     isLoading.value = false;
  //     return;
  //   }
  //   await getFCMToken();
  //   Map<String, String> param = {
  //     "name": nameController.text,
  //     "email": emailController.text,
  //     "mobile": mobile,
  //     "friends_code":referralController.text,
  //     "latitude": (_locationData?.latitude??'').toString(),
  //     "longitude": (_locationData?.longitude??'').toString(),
  //     /*"dob": "",
  //     "city": "",
  //     "area": "",
  //     "street": "",
  //     "pincode": "",
  //     "referral_code": "",
  //     "friends_code": "",
  //     "latitude": "",
  //     "longitude": "",*/
  //     "fcm_id": _fcmToken,
  //     "password": passwordController.text,
  //     "country_code": "+91"
  //   };
  //   await ApiBaseHelper().postAPICall(Uri.parse(registerUrl), param).then(
  //       (value) {
  //     log("value --> $value");
  //     isLoading.value = false;
  //     if (value["error"] ?? true) {
  //       Utils.mySnackBar(
  //           title: "Error Found",
  //           msg: value["message"] ?? "Something went wrong please try again");
  //     } else {
  //       SharedPref.setLoginAndUserId(value['data'][0]['id']);
  //       Get.offAll(() => const DashboardScreen(selectedIndex:0));
  //       Get.delete<RegistrationController>();
  //     }
  //   }, onError: (error) {
  //     isLoading.value = false;
  //   });
  // }

  /// register user method on Sign up
  // Future<void> register(String mobile) async {
  //   if (formKey.currentState!.validate()) {
  //     getRegister(mobile);
  //   }
  // }

// void _validateAndSubmit() {
//   if (emailC.text.isEmpty) {
//     CustomSnackbar.show(context, 'Please Enter Email Address');
//     return;
//   }
//
//   if (passwordC.text.isEmpty) {
//     CustomSnackbar.show(context, 'Please Enter Password');
//     return;
//   }
//
//   Navigator.of(context).pushReplacement(
//     MaterialPageRoute(builder: (context) => const RegistrationScreen()),
//   );
// }
}

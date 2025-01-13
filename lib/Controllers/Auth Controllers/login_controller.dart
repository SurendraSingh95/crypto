// Dart imports:
import 'dart:developer';

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';


// Project imports:


class LoginController extends GetxController {
  RxBool passwordVisible = false.obs;
  RxBool isLoading = false.obs;
  RxInt selectedIndex = 0.obs;

  ///api urls

  String _fcmToken = '';
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final verifyMobileController = TextEditingController();
  final passwordController = TextEditingController();
  final forgetEmailController = TextEditingController();





  ///on controller close
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  ///handle password visibility
  void togglePasswordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }

 //  /// login method on submit
 //  Future<dynamic> login() async {
 //    if (mobileController.text.isEmpty) {
 //      Utils.mySnackBar(
 //          title: "Mobile Number Not Found",
 //          msg: 'Please Enter Mobile Number',
 //          maxWidth: 300);
 //    } else if (passwordController.text.isEmpty) {
 //      Utils.mySnackBar(
 //          title: "Password Not Found",
 //          msg: 'Please Enter Password',
 //          maxWidth: 300);
 //    } else {
 //      getLogin();
 //    }
 //  }
 //
 //  ///  api request for login
 //  getLogin() async {
 //    isLoading.value = true;
 //    final locationAvailable = await checkPermissionAndGetLocation();
 //    if(!locationAvailable){
 //      Utils.mySnackBar(
 //          title: "Please allow Location permission",);
 //      isLoading.value = false;
 //      return;
 //    }
 //    await getFCMToken();
 //    await ApiBaseHelper().postAPICall(Uri.parse(loginUrl), {
 //      "mobile": mobileController.text,
 //      "password": passwordController.text,
 //      "latitude": (_locationData?.latitude??'').toString(),
 //      "longitude": (_locationData?.longitude??'').toString(),
 //      'fcm_id': _fcmToken,
 //    }).then((value) {
 //      log("value --> $value");
 //      isLoading.value = false;
 //      if (value["error"] ?? true) {
 //        Utils.mySnackBar(
 //            title: "Error Found",
 //            msg: value["message"] ?? "Something went wrong please try again");
 //      } else {
 //        SharedPref.setLoginAndUserId(value['data'][0]['id']);
 //        Get.offAll(() => const DashboardScreen(
 //              selectedIndex: 0,
 //            ));
 //        Get.delete<LoginController>();
 //      }
 //    }, onError: (error) {
 //      isLoading.value = false;
 //    });
 //  }
 //
 //  ///  api request for verify mobile
 //  Future<bool> verifyRegisterMobile({bool resend = false}) async {
 //    if (verifyMobileController.text.isEmpty) {
 //      Utils.mySnackBar(
 //          title: "Mobile number not found",
 //          msg: "Please enter mobile number to verify");
 //      return false;
 //    }
 //    Utils.showLoader();
 //    try {
 //      final response = await ApiBaseHelper().postAPICall(Uri.parse(verifyNewUrl), {
 //        "mobile": verifyMobileController.text,
 //      });
 //      Get.back();
 //        if (response["error"] ?? true) {
 //          Utils.mySnackBar(
 //              title: "Error Found",
 //              msg: response["message"] ?? "Something went wrong please try again");
 //          return false;
 //        } else {
 //          print("fergtrgeterter${response['data']}");
 //           if(!resend){
 //             Get.to(() => VerifyOtpScreen(mobileNumber: verifyMobileController.text));
 //           }
 //           return true;
 //        }
 //    } on Exception catch (e) {
 //      Utils.mySnackBar(
 //          title: "Error Found",
 //          msg: e.toString());
 //      return false;
 //    }
 //  }
 //
 //
 //  ///  api request for forgot mobile
 // String _forgotOtp = '';
 // String get forgetOtp => _forgotOtp;
 //  verifyForgotMobile({bool resend = false}) async {
 //    if (forgetPassMobileController.text.isEmpty) {
 //      Utils.mySnackBar(
 //          title: "Mobile number not found",
 //          msg: "Please enter mobile number to verify");
 //      return;
 //    }
 //    Utils.showLoader();
 //   try {
 //     final response =  await ApiBaseHelper().postAPICall(Uri.parse(forgotPassword), {
 //        "mobile": forgetPassMobileController.text,
 //      });
 //        Get.back();
 //        if (response["error"] ?? true) {
 //          Utils.mySnackBar(
 //              title: "Error Found",
 //              msg: response["message"] ?? "Something went wrong please try again");
 //        } else {
 //           _forgotOtp = response['data'] == null ? '' : response['data'].toString();
 //          if(!resend){
 //          Get.to(() => ConfirmOtpScreen( mobile: forgetPassMobileController.text));
 //        }
 //      }
 //   } on Exception catch (e) {
 //     debugPrint(e.toString());
 //     Get.back();
 //   }
 //
 //  }
 //
 //  ///  api request for verify otp
 //  verifyOtp(String otp) async {
 //    if (otp.isEmpty || otp.length != 4) {
 //      Utils.mySnackBar(
 //          title: "Otp not  found", msg: "Please enter otp to verify");
 //      return;
 //    }
 //    Utils.showLoader();
 //    try {
 //      final response = await ApiBaseHelper().postAPICall(Uri.parse(verifyOtpUrl), {
 //        "mobile": verifyMobileController.text,
 //        "otp":otp,
 //      });
 //      Get.back();
 //        if (response["error"] ?? true) {
 //          Utils.mySnackBar(
 //              title: "Error Found",
 //              msg: response["message"] ?? "Something went wrong please try again");
 //        } else {
 //          Get.close(2);
 //          Get.to(() => RegistrationScreen(
 //                mobileNumber: verifyMobileController.text,
 //              ));
 //        }
 //    } on Exception catch (e) {
 //      Get.back();
 //      Utils.mySnackBar(
 //          title: "Error Found",
 //          msg: e.toString());
 //    }
 //  }
 //
 //  //Forget Pass word handling
 //  /// handle verify email and send confirmation code method and get back to the login screen
 //  Future<bool> verifyMobileAndSendCode({bool forget = false}) async {
 //    if (forget && forgetPassMobileController.text.isEmpty) {
 //      Utils.mySnackBar(
 //          title: "Mobile Not Found",
 //          msg: 'Please Enter mobile no.',
 //          maxWidth: 200);
 //      return false;
 //    } else if (!forget && verifyMobileController.text.isEmpty) {
 //      Utils.mySnackBar(
 //          title: "Mobile Not Found",
 //          msg: 'Please Enter mobile no.',
 //          maxWidth: 200);
 //      return false;
 //    } else {
 //      isLoading.value = true;
 //      // await apiRequests.userLogin(
 //      //   mobileController.text,
 //      //   passwordController.text,
 //      //   audioController,
 //      // );
 //      Get.back();
 //      isLoading.value = false;
 //      return true;
 //    }
 //  }
}

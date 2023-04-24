import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/colors/app_color.dart';

class Utils {
  static void fieldfocusChange(BuildContext context, FocusNode curerrent, FocusNode nextFocus) {
    curerrent.unfocus();
    Focus.of(context).requestFocus(nextFocus); 
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
      backgroundColor: AppColor.blackColor,
      msg: message,
      gravity: ToastGravity.BOTTOM,
      );
  }

   static toastMessageCenter(String message) {
    Fluttertoast.showToast(
      backgroundColor: AppColor.blackColor,
      msg: message,
      gravity: ToastGravity.CENTER,
      );
  }

  static SnackBar(String title, String message) {
    Get.snackbar(title, message);
  }

  static bool validateEmail(String email) {
    return true;
  }
}
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

class SingUpController extends GetxController{
 static SingUpController get instance => Get.find();

  //TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final fullname = TextEditingController();
  final phoneNo = TextEditingController();

  //Call this Function from Design & it will do the rest

  void registerUser(String email, String password){

  }


} 
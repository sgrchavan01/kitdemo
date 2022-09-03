import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:kitdemo/screens/dashboard_page.dart';

import '../model/AuthModel.dart';
import '../services/api_list.dart';
import '../utility/SharedPreferenes.dart';
import '../utility/common.dart';
import '../utility/customstring.dart';

class AuthScreenController extends GetxController {
  AuthModel? authResponse;

  bool loading = false;
  TextEditingController usernametxtController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //final pref = PrefRepository();

  void toggleLoading() {
    if (loading) {
      loading = false;
    } else {
      loading = true;
    }
    update();
  }

  Future<AuthModel?> verifyLogin(String username, String password) async {
    toggleLoading();
    final response = await APIList().verifyLogin(username, password);

    printLog(response);

    if (response != null && response.status == 1) {
      if (response.details?.token != -1) {
        showSnackbar(response.message);
        authResponse = response;
        addTokenStringToSF(response.details?.token.toString());
        Get.offAll(() => DashboardScreen(),
            duration: Duration(milliseconds: 500),
            transition: Transition.rightToLeft);
      } else {
        showSnackbar("Invalid Login Credentials");
      }
    } else {
      if (response != null) {
        showSnackbar(response.message);
      } else {
        showSnackbar(somethingwentString);
      }
    }

    toggleLoading();
    update();
    return authResponse;
  }
}

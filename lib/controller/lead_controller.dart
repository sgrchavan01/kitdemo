import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:kitdemo/model/LeadListModel.dart';
import 'package:kitdemo/screens/dashboard_page.dart';

import '../model/AuthModel.dart';
import '../services/api_list.dart';
import '../utility/SharedPreferenes.dart';
import '../utility/common.dart';
import '../utility/customstring.dart';

class LeadScreenController extends GetxController {
  LeadListModel? leadListModel;
  String token = "";
  bool loading = false;

  //final pref = PrefRepository();

  void toggleLoading() {
    if (loading) {
      loading = false;
    } else {
      loading = true;
    }
    update();
  }

  @override
  Future<void> onInit() async {
    token = await getTokenValuesSF();
    getLeadList(token);
  }

  Future<LeadListModel?> getLeadList(String token) async {
    toggleLoading();
    final response = await APIList().getLeadList(token);

    printLog(response);

    if (response != null && response.status == 1) {
      showSnackbar(response.message);
      leadListModel = response;
    } else {
      if (response != null) {
        showSnackbar(response.message);
      } else {
        showSnackbar(somethingwentString);
      }
    }

    toggleLoading();
    update();
    return leadListModel;
  }
}

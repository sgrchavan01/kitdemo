import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/login_page.dart';


printLog(dynamic value) {
  if (kDebugMode) {
    log("--------- App logs ---------\n$value");
  }
}

Future<bool?> toast(String message) {
  return Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.black54,
    textColor: Colors.white,
    fontSize: 15.0,
  );
}

showSnackbar(String? message, [int timeInSec = 3]) {
  Get.showSnackbar(GetSnackBar(
    message: message,
    duration: Duration(seconds: timeInSec),
    snackStyle: SnackStyle.FLOATING,
  ));
}


num getTimestamp() => DateTime.now().millisecondsSinceEpoch;



toggleStatusBar(bool toHide) {
  if (toHide) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
  } else {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }
}

Future<String> getAppVersion() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();

  String appName = packageInfo.appName;
  String packageName = packageInfo.packageName;
  String version = packageInfo.version;
  String buildNumber = packageInfo.buildNumber;

  return version;
}

String formatDraftSavedDate(DateTime date) {
  return DateFormat('dd/MM/yy hh:mm aa').format(date);
}

String formatDraftSavedDateMilli(String millisecond) {
  final date = DateTime.fromMillisecondsSinceEpoch(int.parse(millisecond));
  return DateFormat('dd/MM/yy hh:mm aa').format(date);
}

screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

InputDecoration textFieldBorderDecoration(String hintText) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w300,
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Colors.black26,
        width: 1,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Colors.white,
        width: 1,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Colors.red,
        width: 1,
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Colors.black26,
        width: 1,
      ),
    ),
  );
}

InputDecoration textFieldBorderDecorationWithoutCounter(String hintText) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w300,
    ),
    counterText: "",
    contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Colors.black26,
        width: 1,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Colors.white,
        width: 1,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Colors.red,
        width: 1,
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Colors.black26,
        width: 1,
      ),
    ),
  );
}

bool isValidURL(String url) => Uri.parse(url).isAbsolute;



String convertJPGImageToPNG(String imageUrl) {
  var x = imageUrl.split(".");

  String s = "";

  for (int i = 0; i < x.length - 1; i++) {
    s += x[i];
    s += ".";
  }

  s += "png";

  return s;
}

hideKeyBoard() => SystemChannels.textInput.invokeMethod('TextInput.hide');

listenToListEnding(
  ScrollController scrollController,
  Function onListEndReached,
  BuildContext context,
) {
  scrollController.addListener(
    () {
      double maxScroll = scrollController.position.maxScrollExtent;
      double currentScroll = scrollController.position.pixels;
      double delta = screenHeight(context) * 0.25;

      if (maxScroll - currentScroll <= delta) {
        printLog("reached end...");
        onListEndReached();
      }
    },
  );
}

PageRouteBuilder<dynamic> fadeScreenTransition(dynamic screen) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, anotherAnimation) {
        return screen;
      },
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, anotherAnimation, child) {
        animation = CurvedAnimation(curve: Curves.easeIn, parent: animation);
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      });
}


showLogoutDailog(BuildContext context) {
  Widget cancelButton = FlatButton(
    child: Text(
      "Cancel",
    ),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop();
    },
  );
  Widget continueButton = FlatButton(
    child: Text(
      "Ok",
    ),
    onPressed: () async {
      Navigator.of(context, rootNavigator: true).pop();
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.clear();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
              (Route<dynamic> route) => false);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      "Logout",
    ),
    content: Text(
      "Are you sure want to logout?",
    ),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

import 'package:shared_preferences/shared_preferences.dart';

addTokenStringToSF(String? token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('accesstoken', token!);
}

getTokenValuesSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? stringValue = prefs.getString('accesstoken');
  return stringValue;
}

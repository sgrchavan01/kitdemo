import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:kitdemo/model/AuthModel.dart';
import 'package:kitdemo/model/LeadListModel.dart';
import '../utility/common.dart';
import 'api_constant.dart';
import 'api_utils.dart';

class APIList {
  final constant = ApiConstants();
  final utils = ApiUtils();

  Future<AuthModel?> verifyLogin(String username, String password) async {
    final request = utils.createPostRequest(constant.loginUrl());
    var body = {
      'Details': {'LoginName': username, 'Password': password}
    };
    request.body = json.encode(body);
    request.headers.addAll(constant.getHeader());
    printLog(request);
    http.StreamedResponse response = await request.send();
    try {
      printLog(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 400) {
        final data = await response.stream.bytesToString();
        printLog(data);
        return AuthModel.fromJson(jsonDecode(data));
      } else {
        printLog(response.reasonPhrase);
        return null;
      }
    } catch (e) {
      printLog(e);
      return null;
    }
  }

  Future<LeadListModel?> getLeadList(String token) async {
    final request = utils.createPostRequest(constant.leadlistUrl());
    var body = {
      'Status': "",
      'Message': "",
      'Token': int.parse(token),
      'Details': {'Term': "", 'Mode': "Lead"}
    };
    request.body = json.encode(body);
    request.headers.addAll(constant.getHeader());
    printLog(request);
    http.StreamedResponse response = await request.send();
    try {
      printLog(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 400) {
        final data = await response.stream.bytesToString();
        printLog(data);
        return LeadListModel.fromJson(jsonDecode(data));
      } else {
        printLog(response.reasonPhrase);
        return null;
      }
    } catch (e) {
      printLog(e);
      return null;
    }
  }
}

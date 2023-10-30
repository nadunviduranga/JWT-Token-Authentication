import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jwd_athentication/config.dart';
import 'package:jwd_athentication/models/login_request_model.dart';
import 'package:jwd_athentication/models/register_request_model.dart';
import 'package:jwd_athentication/models/register_response_model.dart';

class APIService {
  static var client = http.Client();

  static Future<bool> login(LoginRequestModel model) async {
    Map<String , String> requestHeader = {
      'Content-type' : 'application/json',
    };

    var url = Uri.http(Config.apiURL , Config.loginAPI);

    var response = await client.post(url , headers: requestHeader, body: jsonEncode(model.toJson()),);

    if(response.statusCode == 200) {

      return true;
    } else {
      return false;
    }
  } 

  static Future<RegisterResponseModel> register(RegisterRequestModel model) async {
    Map<String , String> requestHeader = {
      'Content-type' : 'application/json',
    };

    var url = Uri.http(Config.apiURL , Config.registerAPI);

    var response = await client.post(url , headers: requestHeader, body: jsonEncode(model.toJson()),);

    return registerResponseModel(response.body);
  } 
}
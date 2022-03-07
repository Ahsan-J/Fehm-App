import 'dart:convert';

import 'package:fehm/helper/api.dart';
import 'package:fehm/model/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<ResponseData> login(APIParams params) async {
  params.path = '/auth/login';
  params.method = 'post';

  try {
    var response = await ApiCaller(params: params).send();
    await onSuccessLogin(response, params);
    return response;
  } catch (error) {
    rethrow;
  }
}

Future<void> onSuccessLogin(ResponseData response, APIParams params) async {
  print({"onSuccessLogin", response});
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString("auth_user", jsonEncode(response.data));
  await prefs.setString(
      "auth_token", jsonEncode(response.data?["access_token"]));
}

////////////////////////////////////////////////////////////////////////////////

Future<ResponseData> register(APIParams params) async {
  params.path = '/auth/register';
  params.method = 'post';

  try {
    var response = await ApiCaller(params: params).send();
    return response;
  } catch (error) {
    rethrow;
  }
}
////////////////////////////////////////////////////////////////////////////////

Future<ResponseData> logout(APIParams params) async {
  params.path = '/auth/logout';
  params.method = 'post';

  try {
    var response = await ApiCaller(params: params).send();
    return response;
  } catch (error) {
    rethrow;
  }
}

import 'dart:convert';
import 'package:fehm/model/api.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiCaller {
  APIParams? params;
  Map<String, dynamic>? body;
  Function? onSuccess;
  Function? onFailure;

  ApiCaller({this.params, this.onSuccess, this.onFailure});

  Future<ResponseData> send() async {
    http.Response response;
    var url = Uri.parse('${dotenv.env['BASE_URL']}${params?.path}');
    Uri uri =
        Uri.http(url.authority, url.pathSegments.join("/"), params?.params);
    var body = jsonEncode(params?.data);
    var headers = await getHeaders(params);
    try {
      switch (params?.method?.toLowerCase()) {
        case "post":
          print({body});
          response = await http.post(
            uri,
            headers: headers,
            body: body,
          );
          break;
        case "put":
          response = await http.put(
            uri,
            headers: headers,
            body: body,
          );
          break;
        case "delete":
          response = await http.put(
            uri,
            headers: headers,
            body: body,
          );
          break;
        default:
          response = await http.get(uri, headers: await getHeaders(params));
          break;
      }
    } catch (err) {
      print(err.toString());
      rethrow;
    }

    if (response.statusCode >= 200 && response.statusCode < 300) {
      if (onSuccess != null) onSuccess!(response, params);
      return ResponseData.fromJson(jsonDecode(response.body));
    } else {
      if (onFailure != null) {
        onFailure!(response, params);
      } else {
        print({"OnFailure", response.body});
      }
      throw response;
    }
  }

  Future<Map<String, String>> getHeaders(params) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("auth_token");
    return <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'x-api-key': dotenv.env['API_KEY'] ?? "",
      'authorization': token == null ? "" : 'Bearer $token'
    };
  }
}

import 'package:fehm/helper/api.dart';
import 'package:fehm/model/api.dart';

Future<ResponseData> bookList(APIParams params) async {
  params.path = '/book';
  params.method = 'GET';

  try {
    var response = await ApiCaller(params: params).send();
    return response;
  } catch (error) {
    rethrow;
  }
}

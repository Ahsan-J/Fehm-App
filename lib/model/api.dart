import 'dart:convert';

class APIParams {
  String? path;
  Object? data;
  Map<String, dynamic>? params;
  String? method;

  APIParams({this.path, this.data, this.params, this.method});
}

class MetaData {
  int? total;
  int? pageSize;
  int? currentPage;
  int? lastPage;
  int? from;
  int? to;

  MetaData({
    this.from,
    this.pageSize,
    this.currentPage,
    this.lastPage,
    this.to,
    this.total,
  });

  factory MetaData.fromJson(Map<String, dynamic> parsedJson) {
    return MetaData(
      from: parsedJson['from'] ?? 0,
      to: parsedJson['to'] ?? 0,
      lastPage: parsedJson['last_page'] ?? 0,
      currentPage: parsedJson['current_page'] ?? 0,
      pageSize: parsedJson['page_size'] ?? 0,
      total: parsedJson['total'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "from": from,
      "to": to,
      "last_page": lastPage,
      "current_page": currentPage,
      "page_size": pageSize,
      "total": total,
    };
  }
}

class ResponseData {
  Map<String, dynamic>? data;
  String? message;
  MetaData? meta;
  int? statusCode;

  ResponseData({
    this.data,
    this.message,
    this.meta,
    this.statusCode,
  });

  factory ResponseData.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson['data'] is Map);
    return ResponseData(
      data: parsedJson['data'],
      meta: parsedJson['meta'] != null
          ? MetaData.fromJson(jsonDecode(parsedJson['meta']))
          : null,
      statusCode: parsedJson['statusCode'] ?? 0,
      message: parsedJson['message'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "data": data,
      "meta": meta,
      "statusCode": statusCode,
      "message": message,
    };
  }
}

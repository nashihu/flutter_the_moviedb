import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_json/pretty_json.dart';

import 'failure.dart';

class ApiHelper {
  final Dio dio;
  var enableLog = true;

  ApiHelper(this.dio) {
    _initClient();
  }

  /// Use this constructor in `Unit Testing` only
  ApiHelper.test(this.dio);

  _initClient() {
    dio
      ..options.baseUrl = 'https://api.themoviedb.org/3'
      ..options.contentType = Headers.formUrlEncodedContentType;
  }

  Future<T> get<T>({
    required String path,
    required T Function(Map<String, dynamic> data) success,
    required T Function(Failure failure) failure,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    if (kDebugMode) if (enableLog) print('get $path');
    try {
      final response = await dio.get(
        path,
        options: Options(headers: headers),
        queryParameters: queryParameters,
      );
      if (enableLog) {
        printLongString('result get $path: ${prettyJson(response.data)}');
      }

      return success(response.data);
    } on DioError catch (e) {
      if (enableLog) printLongString('error get $path: ${e.response}');
      return failure(returnFailure(e));
    } catch (e) {
      if (enableLog) printLongString('error get $path: $e');
      return failure(ConnectionFailure(e.toString()));
    }
  }

  Future<T> post<T>({
    required String path,
    required Map<String, dynamic> body,
    required T Function(Map<String, dynamic> data) success,
    required T Function(Failure failure) failure,
    Map<String, dynamic>? headers,
    bool containsFile = false,
  }) async {
    if (kDebugMode) if (enableLog) print('post $path body ${prettyJson(body)}');
    try {
      final response = await dio.post(
        path,
        data: containsFile ? FormData.fromMap(body) : body,
        options: Options()
          ..headers = headers
          ..contentType = Headers.formUrlEncodedContentType,
      );
      if (enableLog) {
        printLongString('result post $path: ${prettyJson(response.data)}');
      }

      return success(response.data);
    } on DioError catch (e) {
      if (enableLog) printLongString('error post $path: ${e.response}');
      return failure(returnFailure(e));
    } catch (e) {
      if (enableLog) printLongString('error post $path: $e');
      return failure(ConnectionFailure(e.toString()));
    }
  }

  Future<T> put<T>({
    required String path,
    required Map<String, dynamic> body,
    required T Function(Map<String, dynamic> data) success,
    required T Function(Failure failure) failure,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    bool containsFile = false,
  }) async {
    try {
      if (kDebugMode) {
        if (enableLog) {
          print('put $path body ${prettyJson(body)}');
        }
      }
      final response = await dio.put(
        path,
        data: containsFile ? FormData.fromMap(body) : body,
        options: Options()
          ..headers = headers
          ..contentType = Headers.formUrlEncodedContentType,
      );
      if (enableLog) {
        printLongString('result put $path: ${prettyJson(response.data)}');
      }

      return success(response.data);
    } on DioError catch (e) {
      if (enableLog) printLongString('error put $path: $e');
      return failure(returnFailure(e));
    } catch (e) {
      if (enableLog) printLongString('error put $path: $e');
      return failure(ConnectionFailure(e.toString()));
    }
  }

  Future<T> delete<T>({
    required String path,
    required T Function(Map<String, dynamic> data) success,
    required T Function(Failure failure) failure,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await dio.delete(
        path,
        options: Options()..headers = headers,
      );

      return success(response.data);
    } on DioError catch (e) {
      return failure(returnFailure(e));
    } catch (e) {
      return failure(ConnectionFailure(e.toString()));
    }
  }

  dynamic returnFailure(DioError e) {
    switch (e.response?.statusCode) {
      case 400:
        return RequestFailure(e.message);
      case 401:
      case 403:
        return AuthorityFailure(e.message);
      case 404:
      case 500:
      case 503:
      default:
        return ServerFailure(e.message);
    }
  }
}

void printLongString(String text) {
  final RegExp pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((RegExpMatch match) {
    if (kDebugMode) print(match.group(0));
  });
}

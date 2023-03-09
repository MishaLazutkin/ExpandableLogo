import 'package:http/http.dart' as http;

import '../models/api_responces/logo_responce.dart';
import 'http_client.dart';

class Api {
  static final _singleton = Api._internal();
  factory Api() => _singleton;
  Api._internal();

  static const scheme = 'https';
  static const host = 'pixabay.com';
  static const apiPath = 'api';

  final _client = HttpClient();



  void _handleHttpError({String? method, Uri? route, error}) {
    try {
      if (error.message != null) {
        print('ERROR: $method $route\n${error.message}');
      }
    } catch (exception, stackTrace) {
      print('HTTP ERROR HANDLING ERROR: $exception');
    }
  }



  T? _parsedResponse<T>(
    http.Response response, {
    Function? onSuccess,
    Function? onError,
  }) {
    if (response == null) return null;

    switch (response.statusCode) {
      case 200: return onSuccess == null ? null : onSuccess(response);
      case 400: return onError == null ? null : onError(response);
      case 500: {

        return null;
      }
      default: return null;
    }
  }

  Future<http.Response?> _get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    if (queryParameters != null) {
      queryParameters.removeWhere((k, v) => v == null);
      queryParameters.forEach((k, v) {
        if (v is! String) queryParameters![k] = v.toString();
      });
      if (queryParameters.isEmpty) {
        queryParameters = null;
      }
    }

    final route = Uri(
      scheme: scheme,
      host: host,
      path: '$apiPath/$path',
      queryParameters: queryParameters,
    );

    try {
      return await _client.get(route, headers: headers);
    } catch (error) {
      _handleHttpError(method: 'GET', route: route, error: error);
      return null;
    }
  }


  Future<LogoResponse?> loadLogo(Map<String,dynamic> params) async {
    final response = await _get('',queryParameters: params);


    return _parsedResponse<LogoResponse>(
      response!,
      onSuccess: (r) => LogoResponse.fromResponse(r),
      onError: (r) => LogoResponse.fromResponse(r),
    );
  }


}

import 'dart:convert';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import '../models/logo.dart';


@immutable
class LogoResponse {
  final Logo? logo;
  const LogoResponse.success({@required this.logo});
  const LogoResponse.error() : logo = null;

  factory LogoResponse.fromResponse(Response response) {
    try {
      final decoded =  json.decode(response.body)  as Map<String, dynamic>;
      return LogoResponse.success(
        logo: Logo.fromJson(decoded),
      );
    } catch (exception, stackTrace) {
      print('LogoResponse parsing ERROR: $exception');
      print(stackTrace);
      return const LogoResponse.error();
    }
  }
}
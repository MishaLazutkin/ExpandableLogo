import 'dart:async';
import 'package:test_task/repositories/api.dart';
import '../models/models/logo.dart';

class ApiRepository {
  ApiRepository({Api? apiClient})
      : _apiClient = apiClient ?? Api();

  final Api _apiClient;

  Future<Logo?> geLogo(int id) async {
    final logoResponce = await _apiClient.loadLogo({'key':'34118786-7d8d736178aae8681faa6284c','id':id});
    return logoResponce?.logo;
  }
}


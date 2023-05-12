import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:tibbi_terminoloji/model/read_model.dart';

class API {
  static var client = http.Client();

  static Future<ReadModel?> getFile() async {
    final String response =
        await rootBundle.loadString('asset/tibbiterminoloji.json');
    final data = await json.decode(response);

    return ReadModel.fromJson(data);
  }
}

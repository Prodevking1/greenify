import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

String apiUrl = "https://plant-disease-detector-pytorch.herokuapp.com/";

getDiseases({@required String? img64}) async {
  var url = Uri.parse(apiUrl);
  try {
    var data = await http.post(
      url,
      body: json.encode({"image": "img64"}),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );
    var info = data.body;
    print("Les resultats $info");
    return {"error": false, "data": info};
  } catch (err) {
    return {"error": true, "data": err};
  }
}

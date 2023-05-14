
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class JSON {

  Future<String> loadJsonData(ValueSetter<List> callback) async {
    final jsonText = await rootBundle.loadString('assets/resto.json');
    final jsonDecoded = json.decode(jsonText);
    final decodedList = jsonDecoded["restaurants"] as List;
    callback.call(decodedList);
    return 'success';
  }
}
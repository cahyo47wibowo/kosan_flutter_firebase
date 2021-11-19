import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import 'package:kosan_flutter_firebase/models/space.dart';
class SpaceProvider extends ChangeNotifier{
    getRecomendedSpaces() async {
      var url = "http://bwa-cozy.herokuapp.com/recommended-spaces";
      var result = await http.get(Uri.parse(url));

      print(result.statusCode);
      print(result.body);


      if(result.statusCode == 200){
        List data = jsonDecode(result.body);
        List<Space> spaces = data.map((item) => Space.fromJson(item)).toList();
        return spaces;
      } else {
        return <Space>[];
      }
    }
}
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'models/inst_list.dart';


class InstApi {
  static final String restaurantsUrl =
      'https://www.avtobanket.ru/restorany-dlya-svadby/?get_all_insts=true';

  Future<Inst> fetchInst() async {
    //await Future.delayed(const Duration(seconds: 2));
    final responce = await http
        .post(restaurantsUrl, headers: {'fromapp': 'flutter/app'});
    if (responce.statusCode != 200) {
      throw Exception('Error responce: ${responce.reasonPhrase}');
    }
    return Inst.fromJson(json.decode(responce.body));
  }
}

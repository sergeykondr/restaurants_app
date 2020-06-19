import 'package:http/http.dart' as http;
import 'dart:convert';

import 'models/inst_list.dart';
import 'models/inst_view.dart';



class Api {
  static final String domenUrl     = 'https://www.avtobanket.ru';
  static final String instsListUrl = 'https://www.avtobanket.ru/restorany-dlya-svadby/?get_all_insts=true';
  static final String instByIdUrl  = 'https://www.avtobanket.ru/insts/inst/view?get_inst_from_app=true&id=';

  Future<Inst> fetchInstsList() async {
    //await Future.delayed(const Duration(seconds: 2));
    final responce = await http
        .post(instsListUrl, headers: {'fromapp': 'flutter/app'});
    if (responce.statusCode != 200) {
      throw Exception('Error responce: ${responce.reasonPhrase}');
    }
    return Inst.fromJson(json.decode(responce.body));
  }

  Future<InstView> fetchInst({int instId}) async {
    String url =  Api.instByIdUrl + instId.toString();
    final responce = await http
        .post(url, headers: {'fromapp': 'flutter/app'});
    if (responce.statusCode != 200) {
      throw Exception('Error responce: ${responce.reasonPhrase}');
    }
    return InstView.fromJson(json.decode(responce.body));
  }
}

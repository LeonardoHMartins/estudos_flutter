import 'package:dio/dio.dart';
import 'package:estudando_flutter/src/utils/cache.dart';

import '../models/nomes.dart';

class BaseRequests {
  Dio dio = Dio(BaseOptions(baseUrl: 'https://swapi.dev/api/'));

  Future getSomething(url) async {
    var response = await dio.get(url);
    return response.data;
  }
}

class PessoasRequests extends BaseRequests {
  Future<List<People>> getAllPessoas() async {
    var pessoas = await Cache().getPeoples();
    if (pessoas.isNotEmpty) {
      return pessoas;
    } else {
      var resp = await getSomething('https://swapi.dev/api/people/');

      var listaPessoas =
          (resp['results'] as List).map((e) => People.fromMap(e)).toList();
      await Cache().setPeoples(listaPessoas);
      return listaPessoas;
    }
  }
}

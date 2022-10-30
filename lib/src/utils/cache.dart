import 'package:estudando_flutter/src/models/nomes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cache {
  Future setPeoples(List<People> pessoas) async {
    final prefs = await SharedPreferences.getInstance();
    var listaCache = pessoas.map((e) => e.toJson()).toList();
    await prefs.setStringList('pessoas', listaCache);
  }

  Future<List<People>> getPeoples() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? pessoas = prefs.getStringList('pessoas');
    if (pessoas != null) {
      return pessoas.map((e) => People.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}

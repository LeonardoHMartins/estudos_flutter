import 'dart:async';

import 'package:estudando_flutter/src/models/nomes.dart';
import 'package:estudando_flutter/src/requests/pessoas_requests.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<People> listPessoas = [];

  @override
  void initState() {
    super.initState();
    Timer.run(() async => await onLoad());
  }

  onLoad() async {
    listPessoas = (await PessoasRequests().getAllPessoas());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: 300,
          height: 300,
          color: Colors.blue,
          child: ListView.builder(
            itemCount: listPessoas.length,
            itemBuilder: (context, index) {
              return Text(
                'Nome: ${listPessoas[index].name},\nGenero: ${listPessoas[index].gender},\nData: ${listPessoas[index].birth_year}\n',
                style: const TextStyle(color: Colors.black),
              );
            },
          )),
    );
  }
}

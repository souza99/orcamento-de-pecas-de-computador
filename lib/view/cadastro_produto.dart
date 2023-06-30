import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:orcamento/dominio/dto/Entrata/placa_de_video_dto.dart';

import '../adaptador/placa_de_video_dominio.dart';
import '../dominio/dto/Entrata/placa_de_video_dto copy.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CadastroPage(),
    );
  }
}

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  String nome = '';
  String marca = '';
  String fabricante = '';

  void _handleSubmit() async {
    PlacaDeVideoDto cadastrar =
        PlacaDeVideoDto(nome: nome, marca: marca, fabricante: fabricante);
    PlacaDeVideoDominio placaDeVideoDominio =
        PlacaDeVideoDominio(placaDeVideoDto: cadastrar);

    var retornoValue = await placaDeVideoDominio.retornaCadastro();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('${retornoValue.mensagem}'),
          content: Text('Produto: ${retornoValue.nome}'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Nome',
              ),
              onChanged: (value) {
                setState(() {
                  nome = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Marca',
              ),
              onChanged: (value) {
                setState(() {
                  marca = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Fabricante',
              ),
              onChanged: (value) {
                setState(() {
                  fabricante = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _handleSubmit,
              child: Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}

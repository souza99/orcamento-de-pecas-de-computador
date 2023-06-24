import 'package:flutter/material.dart';
import 'package:orcamento/dominio/dto/Entrata/placa_mae_dto.dart';

import 'package:flutter/material.dart';
import 'package:orcamento/dominio/dto/Entrata/placa_mae_dto.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro de Placa-Mãe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PlacaMaeCadastroScreen(),
    );
  }
}

class PlacaMaeCadastroScreen extends StatefulWidget {
  @override
  _PlacaMaeCadastroScreenState createState() => _PlacaMaeCadastroScreenState();
}

class _PlacaMaeCadastroScreenState extends State<PlacaMaeCadastroScreen> {
  final _formKey = GlobalKey<FormState>();

  String? soquete;
  String? modelo;
  String? fabricante;
  int? slotMemoria;
  int? slotExpancaoTipo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Placa-Mãe'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Soquete'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
                onSaved: (value) {
                  soquete = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Modelo'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
                onSaved: (value) {
                  modelo = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Fabricante'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
                onSaved: (value) {
                  fabricante = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Slot de Memória'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
                onSaved: (value) {
                  slotMemoria = int.tryParse(value!);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Slot de Expansão Tipo'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
                onSaved: (value) {
                  slotExpancaoTipo = int.tryParse(value!);
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Aqui você pode realizar o processamento dos dados,
                    // como criar uma instância de PlacaMae com os valores informados.
                    PlacaMaeDTO placaMae = PlacaMaeDTO(
                      soquete: soquete!,
                      modelo: modelo!,
                      fabricante: fabricante!,
                      slotMemoria: slotMemoria!,
                      slotExpancaoTipo: slotExpancaoTipo!,
                    );
                    // Exemplo: salvar a instância em um banco de dados ou enviar para um servidor.
                    print(placaMae);
                  }
                },
                child: Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

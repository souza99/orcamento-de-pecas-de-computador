import 'package:flutter/material.dart';
import 'package:orcamento/adaptador/compara_pecas_envia_email.dart';
import 'package:orcamento/dominio/dto/Entrata/empresa_dto_entrada.dart';
import 'package:orcamento/dominio/dto/Entrata/envia_email_orcamento_dto.dart';
import 'package:orcamento/dominio/dto/Entrata/memoria_dto.dart';
import 'package:orcamento/dominio/dto/Entrata/placa_mae_dto.dart';
import 'package:orcamento/dominio/dto/Entrata/processador.dart';
import 'package:orcamento/dominio/empresa.dart';
import 'package:orcamento/dominio/dto/Entrata/placa_de_video_dto.dart';
import './dominio/constantes.dart';

import 'adaptador/empresa_cadastro_web.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    PlacaVideoDTO placaVideoDTO = PlacaVideoDTO(
      consumoEnergia: 30,
      fabricante: "Asus",
      interface: "USB",
      memoriaVRAM: 32,
      modelo: "GTX 1660",
    );

    late List<ProcessadorDTO> autocompleteData = [
      processador,
      processador1,
      processador2
    ];
    late List<PlacaMaeDTO> autocompleteDataPlacaMae = [placaMae, placaMae1];
    late List<PlacaVideoDTO> autocompleteDataPlacaVideo = [placaVideoDTO];
    late List<MemoriaDTO> autocompleteDataMemoriaRam = [memoria, memoria1];


    var placamaeSelecionada;
    var memoriaSelecionada;
    var processadorSelecionado;
    var placaVideoSelecionada = placaVideoDTO;

    
    return Scaffold(
      appBar: AppBar(title: const Text('Formulário')),
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text('Comparador de peças',
                      style: TextStyle(fontSize: 32)),
                ),
              ),
              Center(
                child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text('Selecione as peças para realizar a comparação',
                        style: TextStyle(fontSize: 12))),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child:
                    Autocomplete<MemoriaDTO>(
                  initialValue: memoriaSelecionada != null
                      ? TextEditingValue(
                          text: memoriaSelecionada.modelo!,
                        )
                      : null,
                  fieldViewBuilder: (context, textEditingController, focusNode,
                      onFieldSubmitted) {
                    return TextFormField(
                      controller: textEditingController,
                      focusNode: focusNode,
                      decoration: InputDecoration(
                        labelText: 'Memoria Ram',
                      ),
                    );
                  },
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    return autocompleteDataMemoriaRam.where((option) => option
                        .nome!
                        .toLowerCase()
                        .contains(textEditingValue.text.toLowerCase()));
                  },
                  onSelected: (option) {
                    print(option.nome);
                    memoriaSelecionada = option;
                  },
                  displayStringForOption: (option) => option.nome!,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child:
                    Autocomplete<ProcessadorDTO>(
                  initialValue: processadorSelecionado != null
                      ? TextEditingValue(
                          text: processadorSelecionado.modelo!,
                        )
                      : null,
                  fieldViewBuilder: (context, textEditingController, focusNode,
                      onFieldSubmitted) {
                    return TextFormField(
                      controller: textEditingController,
                      focusNode: focusNode,
                      decoration: InputDecoration(
                        labelText: 'Processador',
                      ),
                    );
                  },
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    return autocompleteData.where((option) => option.modelo!
                        .toLowerCase()
                        .contains(textEditingValue.text.toLowerCase()));
                  },
                  onSelected: (option) {
                    print(option.nome);
                    processadorSelecionado = option;
                  },
                  displayStringForOption: (option) => option.modelo!,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child:
                    Autocomplete<PlacaMaeDTO>(
                  initialValue: placamaeSelecionada != null
                      ? TextEditingValue(
                          text: placamaeSelecionada.modelo!,
                        )
                      : null,
                  fieldViewBuilder: (context, textEditingController, focusNode,
                      onFieldSubmitted) {
                    return TextFormField(
                      controller: textEditingController,
                      focusNode: focusNode,
                      decoration: InputDecoration(
                        labelText: 'Placa Mãe',
                      ),
                    );
                  },
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    return autocompleteDataPlacaMae.where((option) => option
                        .modelo!
                        .toLowerCase()
                        .contains(textEditingValue.text.toLowerCase()));
                  },
                  onSelected: (option) {
                    print(option.modelo);
                    placamaeSelecionada = option;
                  },
                  displayStringForOption: (option) => option.modelo!,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child:
                    Autocomplete<PlacaVideoDTO>(
                  initialValue: placaVideoSelecionada != null
                      ? TextEditingValue(
                          text: placaVideoSelecionada.modelo!,
                        )
                      : null,
                  fieldViewBuilder: (context, textEditingController, focusNode,
                      onFieldSubmitted) {
                    return TextFormField(
                      controller: textEditingController,
                      focusNode: focusNode,
                      decoration: InputDecoration(
                        labelText: 'Placa de Video',
                      ),
                    );
                  },
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    return autocompleteDataPlacaVideo.where((option) => option
                        .modelo!
                        .toLowerCase()
                        .contains(textEditingValue.text.toLowerCase()));
                  },
                  onSelected: (option) {
                    print(option.modelo);
                    placaVideoSelecionada = option;
                  },
                  displayStringForOption: (option) => option.modelo!,
                ),
              ),
              
              ElevatedButton(
                  onPressed: () {
                    ComparaPecasEnviaEmail comparaPecasEnviaEmail =
                        ComparaPecasEnviaEmail();
                    EnviaEmailOrcamentoDTO emailOrcamentoDTO =
                        EnviaEmailOrcamentoDTO(
                            assunto: "Comparar",
                            corpo: "Oi",
                            emailDestinatario: "jpfsouza99@gmail.com");
                    PlacaVideoDTO placaVideoDTO = PlacaVideoDTO(
                      consumoEnergia: 30,
                      fabricante: "Asus",
                      interface: "USB",
                      memoriaVRAM: 32,
                      modelo: "GTX 1660",
                    );
                    print(processadorSelecionado.nome);
                    comparaPecasEnviaEmail.enviarComparacao(
                        emailOrcamentoDTO,
                        memoriaSelecionada,
                        processadorSelecionado,
                        placamaeSelecionada,
                        placaVideoSelecionada);
                  },
                  child: const Text('orçamento')),
            ],
          ),
        ),
      ),
    );
  }
}

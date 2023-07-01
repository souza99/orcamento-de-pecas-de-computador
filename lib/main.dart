import 'package:flutter/material.dart';
import 'package:orcamento/adaptador/compara_pecas_envia_email.dart';
import 'package:orcamento/dominio/dto/Entrata/empresa_dto_entrada.dart';
import 'package:orcamento/dominio/dto/Entrata/envia_email_orcamento_dto.dart';
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
    return Scaffold(
      appBar: AppBar(title: const Text('Formulário')),
      body: Form(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  //envio os dados
                  var empresa = EmpresaDtoEntrada();
                  empresa.nome = "Empresa de teste";
                  empresa.cnpj = "22.673.837/0001-34";
                  EmpresaCadsatroWeb empresaCadsatroWeb = EmpresaCadsatroWeb();
                  var resultado = empresaCadsatroWeb.salvar(empresa);

                  print(resultado);
                },
                child: const Text('enviar')),
            ElevatedButton(
                onPressed: () {
                  ComparaPecasEnviaEmail comparaPecasEnviaEmail =
                      ComparaPecasEnviaEmail();
                  EnviaEmailOrcamentoDTO emailOrcamentoDTO =
                      EnviaEmailOrcamentoDTO(
                          assunto: "Comparar",
                          corpo: "Oi",
                          emailDestinatario: "matheus.vinicius77@gmail.com");
                  PlacaVideoDTO placaVideoDTO = PlacaVideoDTO(
                    consumoEnergia: 30,
                    fabricante: "Asus",
                    interface: "USB",
                    memoriaVRAM: 32,
                    modelo: "GTX 1660",
                  );
                  comparaPecasEnviaEmail.enviarComparacao(emailOrcamentoDTO,
                      memoria, processador, placaMae, placaVideoDTO);
                },
                child: const Text('orçamento')),
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:orcamento/dominio/dto/Entrata/memoria_dto.dart';
import 'package:orcamento/dominio/dto/Entrata/placa_de_video_dto.dart';
import 'package:orcamento/dominio/dto/Entrata/placa_mae_dto.dart';
import 'package:orcamento/dominio/dto/Entrata/processador.dart';
import 'package:orcamento/dominio/dto/Saida/validador_compatibilidade.dart';

class ValidacaoCompatibilidade {
  MemoriaDTO? memoria;
  PlacaMaeDTO? placaMae;
  ProcessadorDTO? processador;
  PlacaVideoDTO? placaVideo;

  ValidacaoCompatibilidade(
      {required this.memoria,
      required this.placaMae,
      required this.processador,
      required this.placaVideo});

  ComparadorCompatibilidadeRetorno comparadorDePecas() {
    if (this.placaMae == null) {
      throw new Exception('É obrigatório enviar a placa mãe');
    }
    if (this.processador == null) {
      throw new Exception('É obrigatório enviar o processador');
    }

    String retornoMensagem = '';

    if (placaMae!.soquete != processador!.soquete) {
      retornoMensagem +=
          'Os soquetes da placa mãe e do processador não são compatíveis\n';
    }

    if (memoria!.quantidade! > placaMae!.slotMemoria!) {
      retornoMensagem +=
          'A quantidade de módulos de memória excede os slots disponíveis na placa mãe\n';
    }

    if (placaMae!.suporteVideoIntegrado == true && placaVideo != null) {
      retornoMensagem +=
          'A placa mãe possui suporte a vídeo integrado, mas uma placa de vídeo dedicada foi especificada\n';
    }

    // Verificação de compatibilidade com base no JSON
    final jsonData = '''{
      "list": [
        {
          "modelo": "X670E Taichi",
          "soquete": "AMD5",
          "fabricante": "ASRock",
          "slotMemoria": "4",
          "slotExpancaoTipo": "dd5",
          "processadoresCompativeis": [
            {
              "nome": "AMD Ryzen 9 7950X3D"
            },
            {
              "nome": "AMD Ryzen 7 7700X"
            }
          ],
          "memoriasRamCompativeis": [
            {
              "nome": "Kingston FURY Beast DDR5 Memory"
            }
          ]
        },
        {
          "modelo": "TUF GAMING X570-PLUS",
          "soquete": "AMD4",
          "fabricante": "ASUSTeK Computer",
          "slotMemoria": "4",
          "slotExpancaoTipo": "dd4",
          "processadoresCompativeis": [
            {
              "nome": "AMD Ryzen 5 5600"
            }
          ],
          "memoriasRamCompativeis": [
            {
              "nome": "XPG Z1 DDR4 DRAM Module"
            }
          ]
        }
      ]
    }''';

    final jsonMap = json.decode(jsonData);

    if (jsonMap.containsKey('list')) {
      final list = jsonMap['list'] as List<dynamic>;
      for (final item in list) {
        final itemModelo = item['modelo'] as String;
        final itemSoquete = item['soquete'] as String;

        if (placaMae!.modelo == itemModelo &&
            placaMae!.soquete != itemSoquete) {
          retornoMensagem +=
              'A placa mãe ${placaMae!.modelo} é compatível com o soquete ${placaMae!.soquete}, mas é recomendado o uso do soquete $itemSoquete\n';
        }

        final processadoresCompativeis =
            item['processadoresCompativeis'] as List<dynamic>;
        final processadoresCompativesNomes =
            processadoresCompativeis.map((e) => e['nome'] as String).toList();
        if (!processadoresCompativesNomes.contains(processador!.nome)) {
          retornoMensagem +=
              'O processador ${processador!.nome} não é compatível com a placa mãe ${placaMae!.modelo}\n';
        }

        final memoriasRamCompativeis =
            item['memoriasRamCompativeis'] as List<dynamic>;
        final memoriasRamCompativeisNomes =
            memoriasRamCompativeis.map((e) => e['nome'] as String).toList();
        if (!memoriasRamCompativeisNomes.contains(memoria!.nome)) {
          retornoMensagem +=
              'A memória RAM ${memoria!.nome} não é compatível com a placa mãe ${placaMae!.modelo}\n';
        }
      }
    }

    ComparadorCompatibilidadeRetorno retornoComparacao =
        ComparadorCompatibilidadeRetorno(
            mensagem: retornoMensagem, codigoOrcamento: '');

    return retornoComparacao;
  }
}

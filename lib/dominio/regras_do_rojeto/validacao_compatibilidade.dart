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
      required this.placaVideo}) {}

  comparadorDePecas() {
    if (this.placaMae == null) {
      throw new Exception('É obrigatorio enviar a placa mãe');
    }
    if (this.processador == null) {
      throw new Exception('É obrigatorio enviar o processador');
    }
    String retornoMensagem = '';

    if (placaMae!.soquete != processador!.soquete) {
      retornoMensagem =
          'Os soquetes da placa mae e do processador, não sao compativeis';
    }

    //criando retorno
    ComparadorCompatibilidadeRetorno retornoComparacao =
        ComparadorCompatibilidadeRetorno(
            mensagem: retornoMensagem, codigoOrcamento: '');
  }
}

import 'package:orcamento/dominio/dto/Entrata/empresa_dto_entrada.dart';
import 'package:orcamento/dominio/dto/Entrata/envia_email_orcamento_dto.dart';
import 'package:orcamento/dominio/dto/Entrata/memoria_dto.dart';
import 'package:orcamento/dominio/dto/Entrata/placa_de_video_dto.dart';
import 'package:orcamento/dominio/dto/Entrata/placa_mae_dto.dart';
import 'package:orcamento/dominio/dto/Entrata/processador.dart';
import 'package:orcamento/dominio/dto/Saida/empresa_dto_saida.dart';
import 'package:orcamento/dominio/dto/Saida/validador_compatibilidade.dart';
import 'package:orcamento/dominio/empresa.dart';

abstract class IComparacaoEntrada {
  ComparadorCompatibilidadeRetorno enviarComparacao(
    EnviaEmailOrcamentoDTO emailOrcamentoDTO,
    MemoriaDTO memoriaDTO,
    ProcessadorDTO processadorDTO,
    PlacaMaeDTO placaMaeDTO,
    PlacaVideoDTO placaVideoDTO,
  );
}

import 'package:orcamento/dominio/dto/Entrata/memoria_dto.dart';
import 'package:orcamento/dominio/dto/Entrata/placa_de_video_dto.dart';
import 'package:orcamento/dominio/dto/Entrata/placa_mae_dto.dart';
import 'package:orcamento/dominio/dto/Entrata/processador.dart';
import 'package:orcamento/dominio/dto/Saida/empresa_dto_saida.dart';
import 'package:orcamento/dominio/dto/Saida/validador_compatibilidade.dart';
import 'package:orcamento/dominio/porta/primaria/i_comparacao_entrada.dart';
import 'package:orcamento/dominio/porta/secondaria/i_empresa_saida.dart';
import 'package:orcamento/dominio/regras_do_rojeto/validacao_compatibilidade.dart';
import 'package:orcamento/dominio/validacao_compatibilidade_aplicacao.dart';

import '../dominio/dto/Entrata/envia_email_orcamento_dto.dart';

class ComparaPecasEnviaEmail implements IComparacaoEntrada {
  late ValidacaoCompatibilidadeAplicacao validacaoCompatibilidade;

  @override
  ComparadorCompatibilidadeRetorno enviarComparacao(
    EnviaEmailOrcamentoDTO emailOrcamentoDTO,
    MemoriaDTO memoriaDTO,
    ProcessadorDTO processadorDTO,
    PlacaMaeDTO placaMaeDTO,
    PlacaVideoDTO placaVideoDTO,
  ) {
    validacaoCompatibilidade = ValidacaoCompatibilidadeAplicacao(
        memoria: memoriaDTO,
        placaMae: placaMaeDTO,
        placaVideo: placaVideoDTO,
        processador: processadorDTO);
    return validacaoCompatibilidade.comparadorDePecas(emailOrcamentoDTO);
  }
}

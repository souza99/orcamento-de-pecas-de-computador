import 'package:orcamento/adaptador/envia_email_orcamento.dart';
import 'package:orcamento/dominio/dto/Entrata/envia_email_orcamento_dto.dart';
import 'package:orcamento/dominio/dto/Entrata/memoria_dto.dart';
import 'package:orcamento/dominio/dto/Entrata/placa_de_video_dto.dart';
import 'package:orcamento/dominio/dto/Entrata/placa_mae_dto.dart';
import 'package:orcamento/dominio/dto/Entrata/processador.dart';
import 'package:orcamento/dominio/dto/Saida/validador_compatibilidade.dart';
import 'package:orcamento/dominio/porta/secondaria/i_envia_email_orcamento.dart';
import 'package:orcamento/dominio/regras_do_rojeto/validacao_compatibilidade.dart';

class ValidacaoCompatibilidadeAplicacao {
  MemoriaDTO? memoria;
  PlacaMaeDTO? placaMae;
  ProcessadorDTO? processador;
  PlacaVideoDTO? placaVideo;
  
  IEnviaEmailOrcamento enviaemails = EnviaEmailOrcamento();

  late ValidacaoCompatibilidade validacaoCompatibilidade;

  ValidacaoCompatibilidadeAplicacao(
      {required this.memoria,
      required this.placaMae,
      required this.processador,
      required this.placaVideo});

  ComparadorCompatibilidadeRetorno comparadorDePecas(
      EnviaEmailOrcamentoDTO emailOrcamentoDTO) {
    validacaoCompatibilidade = ValidacaoCompatibilidade(
        memoria: memoria,
        placaMae: placaMae,
        placaVideo: placaVideo, 
        processador: processador,
        enviaemails: enviaemails);
    return validacaoCompatibilidade.comparadorDePecas(emailOrcamentoDTO);
  }

  
}
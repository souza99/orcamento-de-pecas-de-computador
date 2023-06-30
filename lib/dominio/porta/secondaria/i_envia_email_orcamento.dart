import 'package:orcamento/dominio/dto/Entrata/envia_email_orcamento_dto.dart';

abstract class IEnviaEmailOrcamento {
  Future<void> enviarEmail(EnviaEmailOrcamentoDTO emailInfo);
}

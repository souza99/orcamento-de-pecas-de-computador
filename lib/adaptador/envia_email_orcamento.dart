import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:orcamento/dominio/dto/Entrata/envia_email_orcamento_dto.dart';
import 'package:orcamento/dominio/porta/secondaria/i_envia_email_orcamento.dart';

class EnviaEmailOrcamento implements IEnviaEmailOrcamento {
  @override
  Future<void> enviarEmail(EnviaEmailOrcamentoDTO infoenviaemail) async {
    String username = 'jpfsouza99@gmail.com';
    String password = 'jpfsouza99';

    final smtpServer = gmail(username, password);

    final message = Message()
      ..from = Address(username)
      ..recipients.add(infoenviaemail.emailDestinatario)
      ..subject = infoenviaemail.assunto
      ..text = infoenviaemail.corpo;

    try {
      final sendReport = await send(message, smtpServer);
      print('Email enviado: ${sendReport.toString()}');
    } catch (e) {
      print('Erro ao enviar o email: $e');
    }
  }
}

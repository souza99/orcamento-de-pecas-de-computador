import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:orcamento/dominio/dto/Entrata/envia_email_orcamento_dto.dart';
import 'package:orcamento/dominio/porta/secondaria/i_envia_email_orcamento.dart';

class EnviaEmailOrcamento implements IEnviaEmailOrcamento {
  @override
  Future<void> enviarEmail(EnviaEmailOrcamentoDTO infoenviaemail) async {
    try {
      String username = 'joaopedroferreiradesouza99@gmail.com';

      final message = Message();
      message.subject = infoenviaemail.assunto;
      message.text = infoenviaemail.corpo;
      message.from = Address(username.toString());
      message.recipients.add(infoenviaemail.emailDestinatario);
      var smtpServer =
          await gmailSaslXoauth2(username.toString(), 'stqymdzkdhxalviz');

      var sendReport = await send(message, smtpServer);

      print('Email enviado: ${sendReport.toString()}');
    } catch (e) {
      print('${e.toString()}');
    }
  }
}

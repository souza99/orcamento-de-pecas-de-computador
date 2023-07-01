import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:js';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:orcamento/adaptador/envia_email_orcamento.dart';
import 'package:orcamento/dominio/dto/Entrata/envia_email_orcamento_dto.dart';
import 'package:orcamento/dominio/dto/Entrata/memoria_dto.dart';
import 'package:orcamento/dominio/dto/Entrata/placa_de_video_dto.dart';
import 'package:orcamento/dominio/dto/Entrata/placa_mae_dto.dart';
import 'package:orcamento/dominio/dto/Entrata/processador.dart';
import 'package:orcamento/dominio/dto/Saida/validador_compatibilidade.dart';
import 'package:orcamento/dominio/porta/secondaria/i_envia_email_orcamento.dart';

class ValidacaoCompatibilidade {
  MemoriaDTO? memoria;
  PlacaMaeDTO? placaMae;
  ProcessadorDTO? processador;
  PlacaVideoDTO? placaVideo;

  IEnviaEmailOrcamento enviaemails = EnviaEmailOrcamento();

  ValidacaoCompatibilidade(
      {required this.memoria,
      required this.placaMae,
      required this.processador,
      required this.placaVideo});

  ComparadorCompatibilidadeRetorno comparadorDePecas(
      EnviaEmailOrcamentoDTO emailEnviado) {
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
    ComparadorCompatibilidadeRetorno retornoComparacao =
        ComparadorCompatibilidadeRetorno(
            mensagem: retornoMensagem, codigoOrcamento: '');

    if (retornoMensagem == '') {
      emailEnviado.corpo = geraEmail();
      enviaEmail(emailEnviado);
    }

    return retornoComparacao;
  }

  String gerarHash() {
    const caracteresPermitidos =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random();
    final caracteresSelecionados = HashSet<String>();
    final buffer = StringBuffer();

    while (caracteresSelecionados.length < 16) {
      final indice = random.nextInt(caracteresPermitidos.length);
      final caracter = caracteresPermitidos[indice];

      if (caracteresSelecionados.contains(caracter)) {
        continue; // Ignora caracteres repetidos
      }

      caracteresSelecionados.add(caracter);
      buffer.write(caracter);
    }

    return buffer.toString();
  }

  void enviaEmail(EnviaEmailOrcamentoDTO emailEnviado) {
    enviaemails.enviarEmail(emailEnviado);
  }

  String geraEmail() {
    String identificadorOrcamento = gerarHash();
    String htmlEmail = '''
    <!DOCTYPE html>
    <html>
    <head>
      <title>Orcamento Criado</title>
    </head>
    <body>
      <h1>Orcamento Criado</h1>
      <p>Seu orçamento com número <strong>$identificadorOrcamento</strong> foi criado com sucesso!</p>
    </body>
    </html>
  ''';
    return htmlEmail;
  }
}

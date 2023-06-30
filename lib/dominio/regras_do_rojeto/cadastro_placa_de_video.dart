import 'package:orcamento/dominio/dto/Entrata/placa_de_video_dto%20copy.dart';
import 'package:orcamento/dominio/dto/Entrata/placa_de_video_dto.dart';
import 'package:orcamento/dominio/dto/Saida/placa_de_video_dto_resposta.dart';
import 'package:orcamento/dominio/dto/Saida/placa_de_video_orcamento_dto.dart';
import 'package:orcamento/dominio/porta/secondaria/i_placa_de_video_orcamento.dart';

class CadastroPlacaDeVideo {
  PlacaDeVideoDto placaDeVideoDto;
  IPlacaDeVideoOrcamento placaDeVideoOrcamento;

  CadastroPlacaDeVideo({required this.placaDeVideoDto}) {}

  PlacaDeVideoDtoResposta cadastroProduto() {
    if (placaDeVideoDto.marca == '')
      throw new Exception("Marca é um campo obrigatória");
    if (placaDeVideoDto.nome == '')
      throw new Exception("Nome é um campo obrigatório");

    PlacaDeVideoDtoResposta resposta = PlacaDeVideoDtoResposta(
        nome: placaDeVideoDto.nome,
        // empresaId: 12,
        mensagem: 'Placa cadastrada com sucesso');
    return resposta;
  }

  bool validaProdutoDuplicado() {
    return true;
  }

  PlacaDeVideoOrcamentoDto calcularOrcamentoPlacaDeVideo() {
    PlacaDeVideoOrcamentoDto placaDeVideoOrcamentoDto =
        placaDeVideoOrcamento.receberValoresApi(this.placaDeVideoDto.nome!);

    double valorDoDolarEmReais = placaDeVideoOrcamento.recebeValorAtualDolar();

    placaDeVideoOrcamentoDto.precoEmReais = this.calcularValorEmReais(
        valorDoDolarEmReais, placaDeVideoOrcamentoDto.precoEmDolar!);

    return placaDeVideoOrcamentoDto;
  }

  double calcularValorEmReais(
      double valorDolarEmReais, double valorPlacaEmDolar) {
    return double.parse(
        (valorDolarEmReais * valorPlacaEmDolar).toStringAsFixed(2));
  }
}

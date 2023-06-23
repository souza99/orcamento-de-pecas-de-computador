import 'package:orcamento/dominio/dto/Entrata/placa_de_video_dto.dart';
import 'package:orcamento/dominio/dto/Saida/placa_de_video_dto_resposta.dart';

class CadastroPlacaDeVideo {
  PlacaDeVideoDto placaDeVideoDto;

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
}

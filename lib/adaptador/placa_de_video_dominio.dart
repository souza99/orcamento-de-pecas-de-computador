import 'package:orcamento/dominio/dto/Entrata/placa_de_video_dto%20copy.dart';
import 'package:orcamento/dominio/dto/Entrata/placa_de_video_dto.dart';
import 'package:orcamento/dominio/porta/primaria/i_cadastrar_placa_de_video.dart';
import 'package:orcamento/dominio/regras_do_rojeto/cadastro_placa_de_video.dart';

import '../dominio/dto/Saida/placa_de_video_dto_resposta.dart';

class PlacaDeVideoDominio implements ICadastrarPlacaDeVideo {
  PlacaDeVideoDto placaDeVideoDto;
  CadastroPlacaDeVideo cadastro;

  PlacaDeVideoDominio({required this.placaDeVideoDto})
      : cadastro = CadastroPlacaDeVideo(placaDeVideoDto: placaDeVideoDto);

  @override
  Future<PlacaDeVideoDtoResposta> retornaCadastro() async {
    PlacaDeVideoDtoResposta resposta = cadastro.cadastroProduto();
    return resposta;
  }
}

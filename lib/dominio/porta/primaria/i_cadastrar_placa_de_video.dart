import '../../dto/Saida/placa_de_video_dto_resposta.dart';

abstract class ICadastrarPlacaDeVideo {
  Future<PlacaDeVideoDtoResposta> retornaCadastro();
}

import 'dart:ffi';

import 'package:orcamento/dominio/dto/Saida/placa_de_video_orcamento_dto.dart';

abstract class IPlacaDeVideoOrcamento {
  PlacaDeVideoOrcamentoDto receberValoresApi(String nomePlaca);
  double recebeValorAtualDolar();
}

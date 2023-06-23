import 'package:orcamento/dominio/dto/Saida/empresa_dto_saida.dart';

abstract class IEmpresaSaida {
  Future<EmpresaDtoSaida> salvar(EmpresaDtoSaida empresaDtoSaida);
}
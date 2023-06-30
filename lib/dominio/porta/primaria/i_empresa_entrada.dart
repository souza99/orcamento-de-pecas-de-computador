import 'package:orcamento/dominio/dto/Entrata/empresa_dto_entrada.dart';
import 'package:orcamento/dominio/dto/Saida/empresa_dto_saida.dart';
import 'package:orcamento/dominio/empresa.dart';

abstract class IEmpresaEntrada {
  Future<EmpresaDtoSaida> salvar(EmpresaDtoEntrada empresaDtoEntrada);
}

import 'package:orcamento/dominio/dto/Entrata/empresa_dto_entrada.dart';
import 'package:orcamento/dominio/dto/Saida/empresa_dto_saida.dart';
import 'package:orcamento/dominio/porta/primaria/i_empresa_entrada.dart';
import 'package:orcamento/dominio/empresa.dart';

class EmpresaCadsatroWeb implements IEmpresaEntrada {
  Empresa empresa = Empresa();


  @override
  Future<EmpresaDtoSaida> salvar(EmpresaDtoEntrada empresaDtoEntrada) {
    return empresa.salvar(empresaDtoEntrada);
  }
}

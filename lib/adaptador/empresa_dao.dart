import 'package:orcamento/dominio/dto/Saida/empresa_dto_saida.dart';
import 'package:orcamento/dominio/porta/secondaria/i_empresa_saida.dart';

class EmpresaDao implements IEmpresaSaida {
  @override
  Future<EmpresaDtoSaida> salvar(EmpresaDtoSaida empresaDtoSaida) {
    return Future.value(empresaDtoSaida);
  }
}

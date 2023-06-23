import 'package:orcamento/dominio/dto/Entrata/empresa_dto_entrada.dart';
import 'package:orcamento/interface_entrada/i_empresa_entrada.dart';
import 'package:orcamento/dominio/empresa.dart';

class EmpresaService {
  CadastroEmpresa(IEmpresaEntrada empresaInterface) {
    Empresa empresa = empresaInterface.getEmpresa() as Empresa;
    if (empresa != null) {
      if (empresa.cnpj!.isEmpty) {
        throw Exception("Ao CNPJ é obrigatório");
      } else if (empresa.nome!.isEmpty) {
        throw Exception("O nome da empresa é obrigatório");
      }
    } else {
      throw Exception("Algo deu errado!");
    }
  }
}

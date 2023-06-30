import "dart:io";
import 'package:orcamento/dominio/dto/Entrata/empresa_dto_entrada.dart';
import 'package:orcamento/dominio/dto/Saida/empresa_dto_saida.dart';
import 'package:orcamento/dominio/porta/secondaria/i_empresa_saida.dart';
import '../adaptador/empresa_dao.dart';

class Empresa {
  int? id;
  String? nome;
  String? cnpj;
  IEmpresaSaida iEmpresaSaida = EmpresaDao();

  bool validaNomeMaiorQueTresCaracteres(String nome) {
    if (nome == null || nome.length <= 3) {
      throw Exception("nome é um campo obrigatório");
    }
    return true;
  }

  bool validaSeCnpjEValido(String cnpj) {
    if (cnpj == null || cnpj.length <= 13) {
      throw Exception("CNPJ é inváldio, verifique o valor");
    }
    return true;
  }

  Future<EmpresaDtoSaida> salvar(EmpresaDtoEntrada empresaDto) {
    Empresa empresa = Empresa();
    empresa.cnpj = empresaDto.cnpj;
    empresa.nome = empresaDto.nome;
    validarEmpresa(empresa);
    var empresaSaida =
        EmpresaDtoSaida(nome: empresa.nome!, cnpj: empresa.cnpj!);
    return iEmpresaSaida.salvar(empresaSaida);
  }

  void validarEmpresa(Empresa empresa) {
    if (empresa == null) throw Exception("Algo deu errado!");

    if (empresa.cnpj!.isEmpty) {
      throw Exception("Ao CNPJ é obrigatório");
    } else if (empresa.nome!.isEmpty) {
      throw Exception("O nome da empresa é obrigatório");
    }
  }
}

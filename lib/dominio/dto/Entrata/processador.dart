class Processador {
  String? modelo;
  String? fabricante;
  int? nucleos;
  bool? frequenciaDeClocks;
  String? arquitetura;
  String? soquete;
  String? suporteAInstrucoes;

  Processador(
      {required this.modelo,
      required this.fabricante,
      required this.nucleos,
      required this.frequenciaDeClocks,
      required this.arquitetura,
      required this.soquete,
      required this.suporteAInstrucoes}) {}
}

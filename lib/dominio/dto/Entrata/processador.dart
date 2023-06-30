class ProcessadorDTO {
  String? modelo;
  String? fabricante;
  int? nucleos;
  String? frequenciaDeClocks;
  String? arquitetura;
  String? soquete;
  String? suporteAInstrucoes;
  String? nome;

  ProcessadorDTO(
      {required this.modelo,
      required this.fabricante,
      required this.nucleos,
      required this.frequenciaDeClocks,
      required this.arquitetura,
      required this.soquete,
      required this.suporteAInstrucoes,
      required this.nome}) {}
}

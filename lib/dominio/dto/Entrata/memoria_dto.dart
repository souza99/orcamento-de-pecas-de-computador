class MemoriaDTO {
  int? capacidade;
  String? tipo; //TIPO DA MEMORIA dd4, dd3 ....
  bool? Frequencia;
  String? canal;
  int? quantidade;
  String? nome;

  MemoriaDTO(
      {required this.capacidade,
      required this.tipo,
      required this.Frequencia,
      required this.canal,
      required this.quantidade,
      required this.nome}) {}
}

class PlacaMaeDTO {
  String? soquete;
  String? modelo;
  String? fabricante;
  int? slotMemoria;
  String? slotExpancaoTipo;
  bool? suporteVideoIntegrado;

  PlacaMaeDTO(
      {required this.soquete,
      required this.modelo,
      required this.fabricante,
      required this.slotMemoria,
      required this.slotExpancaoTipo,
      required this.suporteVideoIntegrado}) {}
}

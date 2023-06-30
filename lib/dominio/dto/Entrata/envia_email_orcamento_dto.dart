class EnviaEmailOrcamentoDTO {
  String emailDestinatario;
  String assunto;
  String corpo;

  EnviaEmailOrcamentoDTO(
      {required this.emailDestinatario,
      required this.assunto,
      required this.corpo}) {}
}

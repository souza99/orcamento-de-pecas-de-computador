import 'package:orcamento/dominio/dto/Entrata/placa_mae_dto.dart';
import 'package:orcamento/dominio/dto/Entrata/processador.dart';

import 'dto/Entrata/memoria_dto.dart';

var memoria = MemoriaDTO(
    frequencia: '6000MHz',
    canal: '',
    capacidade: 0,
    nome: 'Kingston FURY Beast DDR5 Memory',
    quantidade: 1,
    tipo: "ddr5");

var memoria1 = MemoriaDTO(
    frequencia: '3200MHz',
    canal: '',
    capacidade: 0,
    nome: 'XPG Z1 DDR4 DRAM Module',
    quantidade: 1,
    tipo: "ddr4");

var placaMae = PlacaMaeDTO(
  fabricante: "ASRock",
  modelo: 'X670E Taichi',
  slotExpancaoTipo: "dd5",
  slotMemoria: 4,
  soquete: 'AMD5',
  suporteVideoIntegrado: true,
);

var placaMae1 = PlacaMaeDTO(
  fabricante: "ASUSTeK Computer",
  modelo: 'TUF GAMING X570-PLUS',
  slotExpancaoTipo: "dd4",
  slotMemoria: 4,
  soquete: 'AMD4',
  suporteVideoIntegrado: true,
);

var processador = ProcessadorDTO(
    modelo: 'AMD Ryzen 9 7950X3D',
    fabricante: "AMD",
    nucleos: 16,
    frequenciaDeClocks: "4.2GHz",
    arquitetura: '',
    soquete: "AMD5",
    suporteAInstrucoes: "Liquid cooler recommended for optimal performance",
    nome: 'AMD Ryzen 9 7950X3D');

var processador1 = ProcessadorDTO(
    modelo: 'AMD Ryzen 7 7700X',
    fabricante: "AMD",
    nucleos: 8,
    frequenciaDeClocks: "4.5GHz",
    arquitetura: '',
    soquete: "AMD5",
    suporteAInstrucoes: "Liquid cooler recommended for optimal performance",
    nome: 'AMD Ryzen 7 7700X');

var processador2 = ProcessadorDTO(
    modelo: 'AMD Ryzen 5 5600',
    fabricante: "AMD",
    nucleos: 6,
    frequenciaDeClocks: "3.5GHz",
    arquitetura: '',
    soquete: "AMD4",
    suporteAInstrucoes: "Liquid cooler recommended for optimal performance",
    nome: 'AMD Ryzen 5 5600');

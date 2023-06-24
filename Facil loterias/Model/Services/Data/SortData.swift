//
//  SortData.swift
//  Facil loterias
//
//  Created by Gustavo Cosme on 22/05/23.
//

import Foundation

struct SortData: Identifiable, Codable {
    
    var id: String {
        UUID().description
    }
    
    let acumulado: Bool?
    let dataApuracao: String?
    let dataProximoConcurso: String?
    let dezenasSorteadasOrdemSorteio: [String]?
    let exibirDetalhamentoPorCidade: Bool?
    let indicadorConcursoEspecial: Int?
    let listaDezenas: [String]?
    let trevosSorteados: [String]?
    let listaDezenasSegundoSorteio: [String]?
    let listaMunicipioUFGanhadores: [SortUFPremiumsData]?
    let listaRateioPremio: [SortRateioPremiumData]?
    let listaResultadoEquipeEsportiva: [SortSportsData]?
    let localSorteio: String?
    let nomeMunicipioUFSorteio: String?
    let nomeTimeCoracaoMesSorte: String?
    let numero: Int?
    let numeroConcursoAnterior: Int?
    let numeroConcursoFinal_0_5: Int?
    let numeroConcursoProximo: Int?
    let numeroJogo: Int?
    let observacao: String?
    let premiacaoContingencia: String?
    let tipoJogo: String
    let tipoPublicacao: Int?
    let ultimoConcurso: Bool
    let valorArrecadado: Float?
    let valorAcumuladoConcurso_0_5: Float?
    let valorAcumuladoConcursoEspecial: Float?
    let valorAcumuladoProximoConcurso: Float?
    let valorEstimadoProximoConcurso: Float?
    let valorSaldoReservaGarantidora: Float?
    let valorTotalPremioFaixaUm: Float?
}

extension SortData {
    
    var listaDezenasResult: [String] {
        self.listaDezenas ?? []
    }
    
    var listaDezenasSegundoSorteioResult: [String] {
        self.listaDezenasSegundoSorteio ?? []
    }
    
    var valorArrecadadoResult: String {
        self.valorArrecadado?.getMoney() ?? "R$ 0.00"
    }
    
    var valorAcumuladoConcurso_0_5Result: String {
        self.valorAcumuladoConcurso_0_5?.getMoney() ?? "R$ 0.00"
    }
    
    var valorAcumuladoConcursoEspecialResult: String {
        self.valorAcumuladoConcursoEspecial?.getMoney() ?? "R$ 0.00"
    }
    
    var valorAcumuladoProximoConcursoResult: String {
        self.valorAcumuladoProximoConcurso?.getMoney() ?? "R$ 0.00"
    }
    
    var valorEstimadoProximoConcursoResult: String {
        self.valorEstimadoProximoConcurso?.getMoney() ?? "R$ 0.00"
    }
    
    var valorSaldoReservaGarantidoraResult: String {
        self.valorSaldoReservaGarantidora?.getMoney() ?? "R$ 0.00"
    }
    
    var valorTotalPremioFaixaUmResult: String {
        self.valorTotalPremioFaixaUm?.getMoney() ?? "R$ 0.00"
    }
    
    var heartTime: SortRateioPremiumData? {
        return  self.listaRateioPremio?.reversed().first
    }
}

//
//  SortRateioPremiumData.swift
//  Facil loterias
//
//  Created by Gustavo Cosme on 22/05/23.
//

import Foundation

struct SortRateioPremiumData: Codable, Identifiable, Hashable {
    var id: String {
        UUID().description
    }
    let descricaoFaixa: String?
    let faixa: Int?
    let numeroDeGanhadores: Int?
    let valorPremio: Double?
    
    var ganhadores: String {
        let ganhadoresCount = self.numeroDeGanhadores ?? 0
        let ganhadorTitle = ganhadoresCount == 1 ? "ganhador" : "ganhadores"
        return ganhadoresCount == 0 ? "Não há ganhadores" : "\(ganhadoresCount.getDecimal()) \(ganhadorTitle)"
    }
    
    var valorPremioResult: String {
        self.valorPremio?.getMoney() ?? "R$ 0.00"
    }
}

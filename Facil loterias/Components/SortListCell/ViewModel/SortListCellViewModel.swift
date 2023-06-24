//
//  SortListCellViewModel.swift
//  Facil loterias
//
//  Created by Gustavo Cosme on 19/05/23.
//

import SwiftUI

struct SortListCellViewModel: Identifiable, Hashable {
    

    
    
    var id: String {
        self.type.rawValue
    }
    
    var type: SortTypes = .federal
    var colorBG: AnyGradient = Color.blue.gradient
    var icon = "logo_trevo_white"
    
    private let colors = Color.Sorts.self
    
    var textColor: Color {
        switch self.type {
        case .timeMania:
            return self.colors.mega
        default:
            return .white
        }
    }
    
    var color: AnyGradient {
        switch self.type {
        case .megaSena:
            return self.colors.mega.gradient
        case .lotoFacil:
            return self.colors.lotoFacil.gradient
        case .quina:
            return self.colors.quina.gradient
        case .lotoMania:
            return self.colors.lotoMania.gradient
        case .timeMania:
            return self.colors.timeMania.gradient
        case .duplaSena:
            return self.colors.duplaSena.gradient
        case .federal:
            return self.colors.federal.gradient
        case .loteca:
            return self.colors.loteca.gradient
        case .diaDeSorte:
            return self.colors.diaDeSorte.gradient
        case .superSete:
            return self.colors.superSete.gradient
        case .milhonaria:
            return self.colors.milhonaria.gradient
        }
    }
    
    var colorDefault: Color {
        switch self.type {
        case .megaSena:
            return self.colors.mega
        case .lotoFacil:
            return self.colors.lotoFacil
        case .quina:
            return self.colors.quina
        case .lotoMania:
            return self.colors.lotoMania
        case .timeMania:
            return self.colors.timeMania
        case .duplaSena:
            return self.colors.duplaSena
        case .federal:
            return self.colors.federal
        case .loteca:
            return self.colors.loteca
        case .diaDeSorte:
            return self.colors.diaDeSorte
        case .superSete:
            return self.colors.superSete
        case .milhonaria:
            return self.colors.milhonaria
        }
    }
    
    var router: String {
        switch self.type {
        case .megaSena:
            return "megasena"
        case .lotoFacil:
            return "lotofacil"
        case .quina:
            return "quina"
        case .lotoMania:
            return "lotomania"
        case .timeMania:
            return "timemania"
        case .duplaSena:
            return "duplasena"
        case .federal:
            return "federal"
        case .loteca:
            return "loteca"
        case .diaDeSorte:
            return "diadesorte"
        case .superSete:
            return "supersete"
        case .milhonaria:
            return "maismilionaria"
        }
    }
}

extension SortListCellViewModel {
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
    
    static func == (lhs: SortListCellViewModel, rhs: SortListCellViewModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    static func getList() -> [SortListCellViewModel]  {
        return [SortListCellViewModel(type: .megaSena),
                SortListCellViewModel(type: .lotoFacil),
                SortListCellViewModel(type: .quina),
                SortListCellViewModel(type: .lotoMania),
                SortListCellViewModel(type: .timeMania),
                SortListCellViewModel(type: .duplaSena),
                SortListCellViewModel(type: .federal),
                SortListCellViewModel(type: .diaDeSorte),
                SortListCellViewModel(type: .superSete),
                SortListCellViewModel(type: .milhonaria)]
    }
}

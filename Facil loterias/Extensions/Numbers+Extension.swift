//
//  Float+Extension.swift
//  Facil loterias
//
//  Created by Gustavo Cosme on 02/06/23.
//

import Foundation

extension Float {
    
    public func getMoney(_ locate: Locale = Locale(identifier: "pt_BR")) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = locate
        return formatter.string(from: self as NSNumber) ?? "R$ 0.00"
    }
}

extension Double {
    
    public func getMoney(_ locate: Locale = Locale(identifier: "pt_BR")) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = locate
        return formatter.string(from: self as NSNumber) ?? "R$ 0.00"
    }
}

extension Int {
    
    public func getDecimal(_ locate: Locale = Locale(identifier: "pt_BR")) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = locate
        return formatter.string(from: self as NSNumber) ?? ""
    }
}


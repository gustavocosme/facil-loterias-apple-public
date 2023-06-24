//
//  String+Extension.swift
//  Facil loterias
//
//  Created by Gustavo Cosme on 08/06/23.
//

import Foundation

extension String {
    func trimmingAllSpaces(using characterSet: CharacterSet = .whitespacesAndNewlines) -> String {
        return components(separatedBy: characterSet).joined()
    }
}

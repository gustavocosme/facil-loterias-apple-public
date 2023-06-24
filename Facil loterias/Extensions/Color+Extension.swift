//
//  Color+Extension.swift
//  Facil loterias
//
//  Created by Gustavo Cosme on 19/05/23.
//

import SwiftUI

// MARK: - Sorts

extension Color {
    
    enum Sorts {
        static var mega = Color(hex: "#009e48")
        static var lotoFacil = Color(hex: "#a81f85")
        static var quina = Color(hex: "#272987")
        static var lotoMania = Color(hex: "#ff8925")
        static var timeMania = Color(hex: "#ffef3a")
        static var duplaSena = Color(hex: "#c2213b")
        static var federal = Color(hex: "#006691")
        static var loteca = Color(hex: "#ff0d24")
        static var diaDeSorte = Color(hex: "#edc130")
        static var superSete = Color(hex: "#96c743")
        static var milhonaria = Color(hex: "#292a6b")
    }
}

extension Color {

    init(hex string: String) {
        var string: String = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if string.hasPrefix("#") {
            _ = string.removeFirst()
        }

        if !string.count.isMultiple(of: 2), let last = string.last {
            string.append(last)
        }

        if string.count > 8 {
            string = String(string.prefix(8))
        }

        let scanner = Scanner(string: string)

        var color: UInt64 = 0
        scanner.scanHexInt64(&color)

        if string.count == 2 {
            let mask = 0xFF

            let g = Int(color) & mask

            let gray = Double(g) / 255.0

            self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: 1)

        } else if string.count == 4 {
            let mask = 0x00FF

            let g = Int(color >> 8) & mask
            let a = Int(color) & mask

            let gray = Double(g) / 255.0
            let alpha = Double(a) / 255.0

            self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: alpha)

        } else if string.count == 6 {
            let mask = 0x0000FF
            let r = Int(color >> 16) & mask
            let g = Int(color >> 8) & mask
            let b = Int(color) & mask

            let red = Double(r) / 255.0
            let green = Double(g) / 255.0
            let blue = Double(b) / 255.0

            self.init(.sRGB, red: red, green: green, blue: blue, opacity: 1)

        } else if string.count == 8 {
            let mask = 0x000000FF
            let r = Int(color >> 24) & mask
            let g = Int(color >> 16) & mask
            let b = Int(color >> 8) & mask
            let a = Int(color) & mask

            let red = Double(r) / 255.0
            let green = Double(g) / 255.0
            let blue = Double(b) / 255.0
            let alpha = Double(a) / 255.0

            self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)

        } else {
            self.init(.sRGB, red: 1, green: 1, blue: 1, opacity: 1)
        }
    }
}

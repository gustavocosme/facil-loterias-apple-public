//
//  Dimensions.swift
//  Facil loterias
//
//  Created by Gustavo Cosme on 17/05/23.
//

import UIKit

struct Dimensions {
    
    enum Margins {
        static let x4: CGFloat = UIScreen.isPad ? 6 : 4
        static let x8: CGFloat = UIScreen.isPad ? 16 : 8
        static let x16: CGFloat = UIScreen.isPad ? 24 : 16
        static let x24: CGFloat = UIScreen.isPad ? 32 : 24
        static let x34: CGFloat = UIScreen.isPad ? 48 : 34
    }
    
    enum Icons {
        static let size: CGFloat = Margins.x16
        static let sizeX1: CGFloat = Margins.x24
        static let sizeX2: CGFloat = UIScreen.isPad ? 66 : 34
    }
    
    enum Cells {
        static let heightX1: CGFloat = UIScreen.isPad ? 58 : 38
        static let heightX3: CGFloat = UIScreen.isPad ? 156 : 74
    }
}

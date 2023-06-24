//
//  UIScreen.swift
//  Facil loterias
//
//  Created by Gustavo Cosme on 17/05/23.
//

import SwiftUI

extension UIScreen {
    
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
   static let isPad: Bool = UIDevice.current.userInterfaceIdiom == .pad ? true : false
}

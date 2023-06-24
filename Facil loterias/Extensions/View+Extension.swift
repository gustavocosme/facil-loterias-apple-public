//
//  View+Extension.swift
//  Facil loterias
//
//  Created by Gustavo Cosme on 19/05/23.
//

import SwiftUI


// MARK: - Normalize ipdate navigation

extension View {
    
    func normalizeIpadPhone() -> some View {
        let userInterfaceIdiom = UIDevice.current.userInterfaceIdiom
        if userInterfaceIdiom == .pad || userInterfaceIdiom == .phone {
            return AnyView(self.navigationViewStyle(StackNavigationViewStyle()))
        } else {
            return AnyView(self)
        }
    }
}

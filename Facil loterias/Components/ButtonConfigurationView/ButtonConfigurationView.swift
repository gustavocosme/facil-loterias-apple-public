//
//  ButtonConfigurationView.swift
//  Facil loterias
//
//  Created by Gustavo Cosme on 24/05/23.
//

import SwiftUI

struct ButtonConfigurationView: View {
    
    var text: String = ""
    var imageSystem = ""
    var imageColor: Color = .accentColor
    var call: () -> Void
    private let margin24 = Dimensions.Icons.sizeX1
    
    var body: some View {
        
        Button(action: {
            self.call()
        }, label: {
            HStack {
            
                Image(systemName: self.imageSystem)
                    .frame(width: self.margin24,
                           height: self.margin24)
                    .foregroundColor(self.imageColor)
                Text(self.text)
                Spacer()
            }
        })
        .accessibilityHint(self.text)
        .accessibilityAddTraits(.isButton)
        .padding(.vertical, 8)
    }
}


#if DEBUG
struct ButtonConfigurationView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonConfigurationView(text: "Title",
                                imageSystem: "mail.fill") {
            
        }
    }
}
#endif

//
//  ToggleConfigurationView.swift
//  Facil loterias
//
//  Created by Gustavo Cosme on 24/05/23.
//

import SwiftUI

struct ToggleConfigurationView: View {
    
    @Binding var isShowing: Bool
    var text: String = "Notificação"
    var imageSystem = "paperplane.fill"
    var call: (Bool) -> Void
    let sizeIcon = Dimensions.Icons.sizeX1
    
    var body: some View {
        
        Button(action: {
            self.call(!isShowing)
        }, label: {
            
            HStack {
           
                Image(systemName: self.imageSystem)
                    .frame(width: self.sizeIcon, height: self.sizeIcon)
                
                Toggle(self.text, isOn: self.$isShowing)
                    .toggleStyle(SwitchToggleStyle(tint: .accentColor))
                    .onChange(of: self.isShowing) { status in
                        self.call(status)
                    }
            }
        })
        .accessibilityHint(self.text)
        .accessibilityAddTraits(.isButton)
        .padding(.vertical, 8)
    }
}

struct ToggleConfigurationView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleConfigurationView(isShowing: .constant(true)) { _ in }
    }
}

//
//  SettingView.swift
//  Facil loterias
//
//  Created by Gustavo Cosme on 15/05/23.
//

import SwiftUI

struct SettingView: View {
    
    @ObservedObject private var viewModel = ConfigurationViewModel()
    @State var isHelp: Bool = false
    private var version: String {
        "\(self.viewModel.appVersion)"
    }
    
    var body: some View {
        
        NavigationStack {
            
            List {
                
                NavigationLink {
                    AboutUIView()
                } label: {
                    ButtonConfigurationView(text: "Sobre",
                                            imageSystem: "square.text.square.fill",
                                            call: self.didTabMail)
                }
                
                ButtonConfigurationView(text: "Fale conosco",
                                        imageSystem: "mail.fill",
                                        call: self.didTabMail)
                
//                Section("Configurações") {
//                    ToggleConfigurationView(isShowing: self.$viewModel.notification,
//                                            text: "Notificações",
//                                            imageSystem: "paperplane.fill",
//                                            call: self.didChangeNotification)
//                }
                
                Section("Versão") {
                    Text(self.version).font(.footnote)
                        .accessibilityHint("Versão \(self.version)")
                        .accessibilityAddTraits(.isStaticText)
                        .frame(height: Dimensions.Cells.heightX1)
                }
                .sheet(isPresented: self.$isHelp){
                    MailView(isShowing: self.$isHelp)
                }
            }
            .navigationTitle("Configurações")
        }
    }
    
    private func didTabMail() {
        if MailView.isSend {
            self.isHelp = true
        }
    }
    
    private func didChangeNotification(status: Bool) {
        self.viewModel.notification = status
    }
}


#if DEBUG
struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
#endif

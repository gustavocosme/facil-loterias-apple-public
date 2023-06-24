//
//  ConfigurationViewModel.swift
//  Facil loterias
//
//  Created by Gustavo Cosme on 24/05/23.
//

import SwiftUI

@MainActor class ConfigurationViewModel: ObservableObject {
   
    private let preferencesManager = PreferencesManager.shared
    
    var appVersion: String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "v1.0.0"
    }
   
    @Published var notification: Bool = PreferencesManager.shared.notification {
      didSet {
          self.preferencesManager.changeNotification(status: notification)
      }
    }
}

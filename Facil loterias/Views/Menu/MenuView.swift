//
//  MenuView.swift
//  Facil loterias
//
//  Created by Gustavo Cosme on 15/05/23.
//

import SwiftUI
import Combine

class TabState: ObservableObject {
    enum Tab: Int, CaseIterable {
        case first = 0
        case second = 1
    }
        
    @Published var selectedTab: Tab = .first
    @Published var lastSelectedTab: Tab = .first
    
    @Published var showTabRoots = Tab.allCases.map { _ in
        false
    }
}

struct MenuView: View {
    
    @State var selected: Int = 0
    @StateObject var tabState = TabState()

    var body: some View {
        
        TabView(selection: self.$selected) {
            
            SortListView(tabState: self.$tabState.selectedTab).tabItem {
                let image = (selected == 0 ? "checkmark.seal" : "checkmark.seal.fill")
                Label("Loterias", systemImage: image)
            }
            .tag(TabState.Tab.first)

            SettingView().tabItem {
                let image = (selected == 1 ? "gearshape.fill" : "gearshape")
                Label("Configurações", systemImage: image)
            }
            .tag(TabState.Tab.second)
        }
        .onReceive(tabState.$selectedTab) { selection in
            if selection == tabState.lastSelectedTab {
                tabState.showTabRoots[selection.rawValue] = false
            }
        }
    }
}


#if DEBUG
struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView().environment(\.colorScheme, .light)
        MenuView().environment(\.colorScheme, .dark)
    }
}
#endif

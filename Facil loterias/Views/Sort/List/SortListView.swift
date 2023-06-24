//
//  SortListView.swift
//  Facil loterias
//
//  Created by Gustavo Cosme on 15/05/23.
//

import SwiftUI

struct SortListView: View {

    let title = "Loterias Brasil"
    let sorts = SortListCellViewModel.getList()
    
    let margin16 = Dimensions.Margins.x16
    
    @Binding var tabState: TabState.Tab

    var body: some View {
        NavigationStack {
            ZStack {
                
                ScrollView {
                    
                    LazyVStack(alignment: .leading) {
                        ForEach(self.sorts) { sort in
                            SortListCell(model: sort)
                                .padding(.bottom, Dimensions.Margins.x4)
                        }
                    }
                    .padding(.top, self.margin16)
                    .padding(.bottom, self.margin16)
                }
            }
            .navigationTitle(self.title)
            .onAppear {
                self.tabState = TabState.Tab.first
            }
        }
    }
}

#if DEBUG
struct SortListView_Previews: PreviewProvider {
    static var previews: some View {
        SortListView(tabState: .constant(.first))
    }
}
#endif

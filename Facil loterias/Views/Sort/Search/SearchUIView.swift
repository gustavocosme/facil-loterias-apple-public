//
//  SearchUIView.swift
//  Facil loterias
//
//  Created by Gustavo Cosme on 12/06/23.
//

import SwiftUI

struct SearchUIView: View {
    
    var sortListCellViewModel: SortListCellViewModel
    var totalCod: Int
    @Binding var isClose: Bool
    @State private var searchText = ""
    
    var names: [String] {
        var cods: [String] = []
        for i in 1...self.totalCod {
            cods.append("\(i)")
        }
        return cods.reversed()
    }
    
    private var searchResults: [String] {
        if searchText.isEmpty {
            return names
        } else {
            return names.filter { $0.contains(searchText) }.reversed()
        }
    }
    
    var body: some View {
        
        NavigationStack {
            List {
                Section(self.sortListCellViewModel.type.rawValue) {
                    ForEach(searchResults, id: \.self) { name in
                        NavigationLink {
                            SortDetailView(sortListCellViewModel: self.sortListCellViewModel,
                                           isButtonSearch: false,
                                           id: name)
                        } label: {
                            Text(name)
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Pesquisa")
            .toolbar {
                ToolbarItemGroup(placement: .primaryAction) {
                    Button(action: {
                        self.isClose = false
                    }, label: { Text("Cancelar") })
                }
            }
            .searchable(text: self.$searchText,
                        placement: .toolbar,
                        prompt: "Informe o código")
        }
    }
}

#if DEBUG
struct SearchUIView_Previews: PreviewProvider {
    static var previews: some View {
        SearchUIView(sortListCellViewModel: SortListCellViewModel(type: .federal),
                                                                  totalCod: 10,
                                                                  isClose: .constant(false))
    }
}
#endif

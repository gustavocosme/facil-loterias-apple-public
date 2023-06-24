//
//  SectionGridResultView.swift
//  Facil loterias
//
//  Created by Gustavo Cosme on 03/06/23.
//

import SwiftUI

struct SectionGridResultView: View {
    
    var texts: [String]
    var colorText: Color
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: self.columns, spacing: 8) {
            ForEach(Array(self.texts.enumerated()), id: \.offset) { index, element in
                Text(element)
                    .font(.title)
                    .bold()
                    .foregroundColor(self.colorText)
            }
        }
    }
}


#if DEBUG
struct SectionGridResultView_Previews: PreviewProvider {
    static var previews: some View {
        SectionGridResultView(texts:["01","02","03","04","05","01","02","03","04","05","01","02","03","04","05","05"],
                              colorText: .blue)
        
    }
}
#endif

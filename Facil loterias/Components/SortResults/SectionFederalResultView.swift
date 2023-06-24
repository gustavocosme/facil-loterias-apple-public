//
//  SectionFederalResultView.swift
//  Facil loterias
//
//  Created by Gustavo Cosme on 04/06/23.
//

import SwiftUI

struct SectionFederalResultView: View {
    
    var texts: [String]

    
    var body: some View {
   
        VStack(alignment: .leading) {
            
            if !self.texts.isEmpty {
                ForEach(Array(self.texts.enumerated()), id: \.offset) { index, element in
                  
                    HStack {
                        Text("Premium \(index+1)").font(.caption2)
                        Spacer()
                    }
                    
                    let numbers: [String] = element.map { String($0) }
                    LineCirclesView(texts: numbers,
                                    textColor: .white,
                                    circleColor: Color.Sorts.federal.gradient)
                }
            }
        }
        
    }
}


#if DEBUG
struct SectionFederalResultView_Previews: PreviewProvider {
    static var previews: some View {
        SectionFederalResultView(texts: ["027085",
                                         "027085",
                                         "027085",
                                         "027085",
                                         "027085",
                                         "027085",
                                         "027085"])
    }
}
#endif

//
//  SectionLineResultView.swift
//  Facil loterias
//
//  Created by Gustavo Cosme on 03/06/23.
//

import SwiftUI

struct SectionLineResultView: View {
    
    var texts1: [String]
    var texts2: [String]

    var colorText: Color
    var colorBG: AnyGradient

    var body: some View {
        VStack(alignment: .leading) {
            if !self.texts1.isEmpty {
                if !self.texts2.isEmpty {
                    Text("Sorteio 1").font(.footnote)
                }
                LineCirclesView(texts: self.texts1,
                                textColor: self.colorText,
                                circleColor: self.colorBG)
            }

            if !self.texts2.isEmpty {
                Text("Sorteio 2").font(.footnote)
                LineCirclesView(texts: self.texts1,
                                textColor: self.colorText,
                                circleColor: self.colorBG)
            }
        }
    }
}


#if DEBUG
struct SectionLineResultView_Previews: PreviewProvider {
    static var previews: some View {
        SectionLineResultView(texts1: ["01","02","03","04","05","06"],
                              texts2: ["01","02","03","04","05","06"],
                              colorText: .white,
                              colorBG: Color.blue.gradient)
    }
}
#endif

//
//  SectionSuperSeteResultView.swift
//  Facil loterias
//
//  Created by Gustavo Cosme on 04/06/23.
//

import SwiftUI

struct SectionSuperSeteResultView: View {
    
    var texts1: [String]
    var texts2: [String]

    var colorText: Color
    var colorBG: AnyGradient
    
    var body: some View {
        VStack(alignment: .leading) {
            if !self.texts1.isEmpty {
                
                Text("Colunas")
                    .bold()
                LineCirclesView(texts: ["1","2","3","4","5","6","7"],
                                textColor: .primary,
                                circleColor: Color.clear.gradient)
                
                LineCirclesView(texts: self.texts1,
                                textColor: self.colorText,
                                circleColor: self.colorBG)
            }

            if !self.texts2.isEmpty {
                
                Text("Colunas")
                    .bold()
                    .padding(.top, 2)

                LineCirclesView(texts: ["1","2","3","4","5","6","7"],
                                textColor: .primary,
                                circleColor: Color.clear.gradient)
                
                LineCirclesView(texts: self.texts2,
                                textColor: self.colorText,
                                circleColor: self.colorBG)
            }
        }
    }
}


#if DEBUG
struct SectionSuperSeteResultView_Previews: PreviewProvider {
    static var previews: some View {
        SectionSuperSeteResultView(texts1: ["01","02","03","04","05","06","07"],
                                   texts2: ["01","02","03","04","05","06","06"],
                                   colorText: .white,
                                   colorBG: Color.blue.gradient)
    }
}
#endif

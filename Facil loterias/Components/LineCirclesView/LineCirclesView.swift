//
//  LineCirclesView.swift
//  Facil loterias
//
//  Created by Gustavo Cosme on 29/05/23.
//

import SwiftUI

struct LineCirclesView: View {
    
    var texts: [String]
    var textColor: Color
    var circleColor: AnyGradient

    var body: some View {
        HStack {
            ForEach(self.texts, id: \.self) { text in
                TextCircleView(text: text,
                               textColor:self.textColor,
                               circleColor: self.circleColor)
            }
        }
    }
}


#if DEBUG
struct LineCirclesView_Previews: PreviewProvider {
    static var previews: some View {
        LineCirclesView(texts: ["01", "02", "03"],
                        textColor: .white,
                        circleColor: Color.blue.gradient)
    }
}
#endif

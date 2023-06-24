//
//  TextCircleView.swift
//  Facil loterias
//
//  Created by Gustavo Cosme on 29/05/23.
//

import SwiftUI

struct TextCircleView: View {
    
    var text: String
    var textColor: Color
    var circleColor: AnyGradient
    private let size = UIScreen.screenSize.width/10
    
    var body: some View {
        ZStack {
            Circle()
                .fill(self.circleColor)
                .frame(width: self.size, height: self.size)
            Text(self.text)
                .foregroundColor(self.textColor)
                .font(Fonts.Titles.x24)
                .bold()
        }
    }
}


#if DEBUG
struct TextCircleView_Previews: PreviewProvider {
    static var previews: some View {
        TextCircleView(text: "01",
                       textColor: .white,
                       circleColor: Color.Sorts.federal.gradient)
    }
}
#endif
